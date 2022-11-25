import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../screens/skill_screen.dart';
import 'course_check_item.dart';
import 'skill_imporove_card1.dart';

class ListSkillAndCourse extends StatelessWidget {
  ListSkillAndCourse({
    Key? key,
  }) : super(key: key);
  RxBool checkPage = false.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => checkPage.value = !checkPage.value,
          child: Row(
            children: [
              const SizedBox(width: 20.0),
              Obx(
                () => Text(
                  checkPage.value ? 'List Skill' : 'List Course',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                  ),
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: AppColors.textColor)
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Obx(
          () => checkPage.value
              ? Column(
                  children: [
                    SkillImproveCard1(
                      title: 'Coding Skills',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                      time: DateTime.now(),
                    ),
                    SkillImproveCard1(
                      title: 'English Skills',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                      time: DateTime.now(),
                    ),
                    SkillImproveCard1(
                      title: 'Physics Skills',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                      time: DateTime.now(),
                    ),
                  ],
                )
              : Column(
                  children: [
                    CourseCheckItem(
                      mainTitle: 'Oxford Class A',
                      description: 'Student with medium grades on campus',
                      les: 14,
                      lesComplete: 14,
                      time: DateTime.now(),
                      finalTest: true,
                      checkComplete: true,
                    ),
                    CourseCheckItem(
                      mainTitle: 'Oxford Class A',
                      description: 'Student with medium grades on campus',
                      les: 14,
                      lesComplete: 3,
                      time: DateTime.now(),
                      finalTest: false,
                      checkComplete: false,
                    ),
                    CourseCheckItem(
                      mainTitle: 'Oxford Class A',
                      description: 'Student with medium grades on campus',
                      les: 14,
                      lesComplete: 14,
                      time: DateTime.now(),
                      finalTest: false,
                      checkComplete: false,
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
        )
      ],
    );
  }
}
