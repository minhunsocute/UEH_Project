import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class ItemVideoPlay extends StatelessWidget {
  final String thumbNails;
  final String title;
  final String time;
  final bool check;
  const ItemVideoPlay({
    Key? key,
    required this.thumbNails,
    required this.title,
    required this.time,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(right: 10.0, top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: AppColors.shadowWidget,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                thumbNails,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.timelapse,
                      color: AppColors.primaryColor, size: 17.0),
                  Text(
                    ' $time',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        check
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.green.withOpacity(0.2),
                ),
                child: const Text(
                  'Is playing',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: const Icon(Icons.play_arrow,
                    color: Colors.black, size: 16.0),
              ),
      ],
    );
  }
}
