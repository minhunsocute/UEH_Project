import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../screens/review_detail_screen.dart';

class ReviewCardCustom extends StatelessWidget {
  final String title;
  final String description;
  final DateTime time;
  const ReviewCardCustom({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const ReviewDetailScreen()),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
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
                  Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    style: const TextStyle(
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
                        ' ${time.day}/${time.month}/${time.year}',
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
    );
  }
}
