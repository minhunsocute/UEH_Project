import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_color.dart';
import '../../../routes/route_name.dart';
import '../../../widgets/app_headers.dart';
import '../../../widgets/custom_button.dart';
import '../../auth/screens/sign_in_screen.dart';

//Function page controller
PageController pageController = PageController(initialPage: 0, keepPage: true);
void onButtonTape(int index) {
  pageController.animateToPage(index,
      duration: const Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
//  pageController.jumpToPage(index);
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    List<Widget> listViewIntro = [
      MainPageViewIntro(
          heightDevice: heightDevice,
          gifPath: 'assets/images/intro1.png',
          mainTitle: 'Manage your task',
          title:
              'You can easily manage all of your daily tasks in DoMe for free'),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/images/intro2.png',
        mainTitle: 'Create daily routine',
        title:
            'In Uptodo you can create your personalized routine to stay productive',
      ),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/images/intro3.png',
        mainTitle: 'Orgonaize your tasks',
        title:
            'You can organize your daily tasks by adding your tasks into separate categories',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            // const AppHeader(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppHeader(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return listViewIntro[index];
                },
                itemCount: listViewIntro.length,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listViewIntro.length,
                    itemBuilder: (context, index) => buildIndicator(
                        _currentIndex == index, MediaQuery.of(context).size),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100.0),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Previous',
                    onTap: () {
                      setState(() {
                        if (_currentIndex == 1) {
                          onButtonTape(0);
                        } else if (_currentIndex == 2) {
                          onButtonTape(1);
                        } else {}
                      });
                    },
                    backgroundColor: Colors.white,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                    child: CustomButton(
                        text: (_currentIndex == 2) ? 'Let\'s Start' : 'Next',
                        onTap: () {
                          setState(() {
                            if (_currentIndex == 0) {
                              onButtonTape(1);
                            } else if (_currentIndex == 1) {
                              onButtonTape(2);
                            } else {
                              Get.toNamed(RouteNames.signInScreen);
                            }
                          });
                        }))
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 30 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        //container with border
        color: isActive
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
        ],
      ),
    );
  }
}

class MainPageViewIntro extends StatelessWidget {
  final String gifPath;
  final String mainTitle;
  final String title;
  const MainPageViewIntro({
    Key? key,
    required this.heightDevice,
    required this.gifPath,
    required this.mainTitle,
    required this.title,
  }) : super(key: key);

  final double heightDevice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(),
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(gifPath),
            ),
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainTitle,
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: heightDevice / 20,
        ),
      ],
    );
  }
}
