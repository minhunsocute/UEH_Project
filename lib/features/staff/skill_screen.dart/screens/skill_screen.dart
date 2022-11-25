import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ueh_project/features/staff/skill_screen.dart/screens/course_detail_screen.dart';
import 'package:ueh_project/features/staff/skill_screen.dart/screens/message_screen.dart';
import 'package:ueh_project/features/staff/skill_screen.dart/screens/skill_detail_screen.dart';

import '../../../../constants/app_color.dart';
import '../widgets/course_check_item.dart';
import '../widgets/list_skill_course.dart';
import '../widgets/mess_item.dart';

class SkillScreen extends StatelessWidget {
  SkillScreen({super.key});
  RxInt checkPage = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(
            checkPage.value == 0 ? 'List Skills to improve' : 'Message',
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => checkPage.value = 1 - checkPage.value,
              icon: const Icon(Icons.change_circle, color: AppColors.textColor))
        ],
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
              boxShadow: AppColors.shadowWidget,
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
          Obx(
            () => checkPage.value == 0
                ? ListSkillAndCourse()
                : Column(
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => MessPersonScreen()),
                        child: MessItem(
                          image: 'assets/images/person.png',
                          name: 'Nguyen Minh Hung',
                          lassMessage: 'Hello Bro! Nice to meet you',
                          time: DateTime.now(),
                        ),
                      ),
                      MessItem(
                        image: 'assets/images/person1.png',
                        name: 'Truong Huynh Duc Hoang',
                        lassMessage: 'Hello Bro! Nice to meet you',
                        time: DateTime.now(),
                      ),
                      MessItem(
                        image: 'assets/images/person2.png',
                        name: 'NGuyen Trung Hieu',
                        lassMessage: 'Hello Bro! Nice to meet you',
                        time: DateTime.now(),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
