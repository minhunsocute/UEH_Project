import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class MessItem extends StatelessWidget {
  final String image;
  final String name;
  final String lassMessage;
  final DateTime time;
  const MessItem({
    Key? key,
    required this.image,
    required this.name,
    required this.lassMessage,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: AppColors.textColor.withOpacity(0.7),
                    blurRadius: 10.0),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Text(
                  lassMessage,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                )
              ],
            ),
          ),
          SizedBox(
            width: 90.0,
            child: Row(
              children: [
                const Icon(Icons.timelapse_outlined,
                    color: AppColors.primaryColor, size: 20.0),
                Expanded(
                  child: Text(
                    ' ${time.day}/${time.month}/${time.year}',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
