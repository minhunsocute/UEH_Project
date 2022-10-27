import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        children: [
          NotificationItem(
            time: DateTime.now(),
            type: 0,
            name: "Nguyen Minh Hung",
          ),
          NotificationItem(
            time: DateTime.now(),
            type: 1,
            name: "Nguyen Minh Hung",
          ),
          NotificationItem(
            time: DateTime.now(),
            type: 2,
            name: "Nguyen Minh Hung",
          ),
          NotificationItem(
            time: DateTime.now(),
            type: 3,
            name: "Nguyen Minh Hung",
          ),
        ],
      ),
    );
  }
}
