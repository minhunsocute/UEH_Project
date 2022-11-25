import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ueh_project/constants/fake_data.dart';
import 'package:ueh_project/features/staff/skill_screen.dart/screens/skill_detail_screen.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../widgets/course_card_item.dart';

class ReviewDetailScreen extends StatelessWidget {
  const ReviewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: () {},
          child: CustomButton(text: 'Confirm', onTap: () {}),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Review Detail',
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
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: AppColors.shadowWidget,
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nguyen Minh Hung',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                        maxLines: 3,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.clock,
                              color: AppColors.primaryColor, size: 15),
                          Text(
                            ' ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                            style: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Skill Improve',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ...listSkillImprove.map((e) => skillImproveItem(e)),
          const SizedBox(height: 10.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Courses De xuat',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          CourseCardItem(
            mainTitle: 'Oxford Class A',
            description: 'Student with medium frades on campus',
            price: 118,
            les: 14,
            time: DateTime.now(),
            noPeople: 25,
            rating: 4.8,
          ),
        ],
      ),
    );
  }

  Padding skillImproveItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
      child: Row(
        children: [
          const Icon(Icons.check, color: AppColors.primaryColor),
          Expanded(
            child: Text(
              ' $title',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
