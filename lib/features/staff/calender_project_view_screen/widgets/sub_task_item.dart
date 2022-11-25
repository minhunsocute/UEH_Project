import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';

class SubTaskItem extends StatelessWidget {
  final String mainTitle;
  final DateTime time;
  const SubTaskItem({
    Key? key,
    required this.mainTitle,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withOpacity(0.1),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainTitle,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'Today - ${DateFormat().add_jm().format(time)}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child:
                    const Icon(Icons.check_box, color: AppColors.primaryColor),
              ),
            ]),
          ],
        ));
  }
}
