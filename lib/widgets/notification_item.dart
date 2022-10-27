import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/app_color.dart';

class NotificationItem extends StatelessWidget {
  final String name;
  final int type;
  final DateTime time;
  const NotificationItem({
    Key? key,
    required this.time,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> listColor1 = [
      Colors.blue,
      Colors.red,
      AppColors.primaryColor,
      Colors.green,
    ];
    List<Color> listColor2 = [
      Colors.blue.withOpacity(0.3),
      Colors.red.withOpacity(0.3),
      AppColors.primaryColor.withOpacity(0.3),
      Colors.green.withOpacity(0.3),
    ];

    List<String> listTitle = [
      "You got a new Task from",
      "You got a new Message from",
      "You got a new Course from",
      "You got a new Evaluate from",
    ];
    List<IconData> listIcon = [
      Icons.task,
      Icons.send,
      Icons.laptop,
      Icons.event_available_outlined
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: listColor2[type],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Icon(listIcon[type], color: listColor1[type]),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${listTitle[type]} Nguyen Minh Hung',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.timelapse,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                        ' ${DateFormat().add_yMd().format(time)} ${DateFormat().add_jm().format(time)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
