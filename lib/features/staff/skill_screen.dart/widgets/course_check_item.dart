import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../screens/course_detail_screen.dart';

class CourseCheckItem extends StatelessWidget {
  final String mainTitle;
  final String description;
  final int les;
  final int lesComplete;
  final DateTime time;
  final bool finalTest;
  final bool checkComplete;
  const CourseCheckItem({
    Key? key,
    required this.mainTitle,
    required this.description,
    required this.les,
    required this.lesComplete,
    required this.time,
    required this.finalTest,
    required this.checkComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => CourseDetailScreen()),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: AppColors.shadowWidget,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Instructor ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.textColor.withOpacity(0.2),
                                  blurRadius: 5.0,
                                ),
                              ],
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/person.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        mainTitle,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: les == lesComplete
                          ? Colors.green.withOpacity(0.3)
                          : Colors.blue.withOpacity(0.3),
                    ),
                    child: Text(
                      les == lesComplete ? 'Done' : 'In Progress',
                      style: TextStyle(
                        color: les == lesComplete ? Colors.green : Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.youtube,
                  color: AppColors.textColor,
                  size: 18.0,
                ),
                Text(
                  ' $les lessons',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor.withOpacity(0.5),
                        AppColors.primaryColor.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Text(
                    '$lesComplete/$les',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  'Done in ${DateFormat().add_yMEd().format(time)}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      'Final Test: ',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      finalTest ? "Pass" : "Failed",
                      style: TextStyle(
                        color: finalTest ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
