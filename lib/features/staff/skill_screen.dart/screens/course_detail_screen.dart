import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:ueh_project/features/staff/skill_screen.dart/screens/lesson_detail_screen.dart';
import 'package:ueh_project/widgets/custom_button.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';
import '../widgets/lesson_item.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: () {},
          child: CustomButton(text: 'Buy Learning now', onTap: () {}),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Complete UX/UI & App Design',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    children: [
                      TextSpan(
                        text: '\$',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(
                        text: '20.00',
                        style: TextStyle(color: AppColors.textColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      ' 4.8',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '2.8k enrolled',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.only(bottom: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textColor.withOpacity(0.2),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rakib Kowshar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Product Designer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: const [
                              Text(
                                '6 Coures ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: widthDevice - 240),
                    child: Image.asset(
                      'assets/images/person3.png',
                      height: 200,
                      width: 200,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Description',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: ReadMoreText(
              'Doctors, also known as physicians, are licensed health professionals who maintain and restore human health through the practice of medicine. They examine patients, review their medical history, diagnose illnesses or injuries, administer treatment, and counsel patients on their health and well-being.',
              trimLines: 4,
              style: TextStyle(color: AppColors.textColor),
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                '24 Lessons',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ...listLessons.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: InkWell(
                onTap: () => Get.to(() => LessonDetailScreen()),
                child: LessonItem(
                  title: e['title'],
                  h: e['hour'],
                  m: e['minute'],
                  check: e['check'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
