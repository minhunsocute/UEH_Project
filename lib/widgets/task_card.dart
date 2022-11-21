import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_color.dart';
import '../routes/route_name.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final DateTime time;
  final bool check;
  final Color color;
  final String cateTitle;
  final Color cateColor;
  final IconData icon;
  const TaskCard({
    Key? key,
    required this.title,
    required this.time,
    required this.check,
    required this.color,
    required this.cateTitle,
    required this.cateColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteNames.taskDetailScreen),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: AppColors.shadowWidget,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: cateColor,
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: color, size: 17.0),
                      const SizedBox(width: 5.0),
                      Text(
                        cateTitle,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                (!check)
                    ? const Icon(Icons.check_box_outline_blank_sharp,
                        color: AppColors.textColor)
                    : const Icon(Icons.check_box_outlined,
                        color: AppColors.textColor),
              ],
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.timelapse_outlined,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        'Today At ${time.hour}:${time.minute}',
                        style: const TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
