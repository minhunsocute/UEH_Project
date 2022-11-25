import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../screens/course_detail_screen.dart';

class CourseCardItem extends StatelessWidget {
  final String mainTitle;
  final String description;
  final double price;
  final int les;
  final DateTime time;
  final int noPeople;
  final double rating;
  const CourseCardItem(
      {super.key,
      required this.mainTitle,
      required this.description,
      required this.price,
      required this.les,
      required this.time,
      required this.noPeople,
      required this.rating});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => CourseDetailScreen(),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.clock,
                      color: AppColors.textColor,
                      size: 18.0,
                    ),
                    Text(
                      ' ${DateFormat().add_yMEd().format(time)} - ${DateFormat().add_yMEd().format(time)}',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
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
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$noPeople people to buy',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0)),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 18.0),
                    Text(
                      ' $rating',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
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
