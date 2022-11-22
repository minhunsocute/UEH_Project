import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project/constants/app_color.dart';
import 'package:ueh_project/widgets/custom_button.dart';

import '../../../../routes/route_name.dart';
import '../../../../widgets/skill_improve_card.dart';
import '../../../../widgets/task_card.dart';

List<Map<String, dynamic>> fakeTask = [
  {
    'title': 'Do Math Homework',
    'time': DateTime.now(),
    'check': false,
    'color': Colors.red,
    'cateTitle': 'Work',
    'cateColor': Colors.red.withOpacity(0.3),
    'icon': Icons.work,
  },
  {
    'title': 'Do History Homework',
    'time': DateTime.now(),
    'check': false,
    'color': Colors.blue,
    'cateTitle': 'Home',
    'cateColor': Colors.blue.withOpacity(0.3),
    'icon': Icons.home,
  },
  {
    'title': 'Do physics Homework',
    'time': DateTime.now(),
    'check': true,
    'color': Colors.green,
    'cateTitle': 'Outside',
    'cateColor': Colors.green.withOpacity(0.3),
    'icon': Icons.home,
  }
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  RxInt checkSwap = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () => Get.toNamed(RouteNames.notification_screen),
            child: const Icon(Icons.notifications_outlined,
                color: AppColors.textColor),
          ),
          const SizedBox(width: 10.0),
        ],
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.textColor.withOpacity(0.7),
                      blurRadius: 10.0),
                ],
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/person.png'),
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome to Todo App',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Nguyen Minh Hung',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              // border: Border.all(
              //   width: 1,
              //   color: AppColors.textColor,
              // ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.4),
                  blurRadius: 4.0,
                )
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: AppColors.textColor),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'Search here...',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Task Today',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),
                ),
                Obx(
                  () => InkWell(
                    borderRadius: BorderRadius.circular(5.0),
                    onTap: () => checkSwap.value = 1 - checkSwap.value,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.primaryColor.withOpacity(0.6),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.change_circle_outlined,
                              color: AppColors.textColor, size: 20.0),
                          const SizedBox(width: 5.0),
                          checkSwap.value == 0
                              ? const Text('Completed',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                              : const Text(
                                  'Uncompleted',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(() => Column(
                children: [
                  ...fakeTask.map(
                    (e) => ((e['check'] && checkSwap.value == 0) ||
                            (!e['check'] && checkSwap.value == 1))
                        ? TaskCard(
                            title: e['title'],
                            time: e['time'],
                            check: e['check'],
                            color: e['color'],
                            cateTitle: e['cateTitle'],
                            cateColor: e['cateColor'],
                            icon: e['icon'])
                        : Container(),
                  ),
                ],
              )),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Skills to improve',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See More',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                SkillImproveCard(
                  title: 'Coding Skills',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                  time: DateTime.now(),
                  func: () {},
                ),
                SkillImproveCard(
                  title: 'English Skills',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                  time: DateTime.now(),
                  func: () {},
                ),
                SkillImproveCard(
                  title: 'Coding Skills',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                  time: DateTime.now(),
                  func: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
