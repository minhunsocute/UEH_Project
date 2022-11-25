import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class SkillImproveCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime time;
  final VoidCallback func;
  const SkillImproveCard({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 160,
      margin: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadowWidget,
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Icon(
                Icons.add_circle_sharp,
                color: AppColors.primaryColor,
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Text(
            description,
            maxLines: 3,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.textColor,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.timelapse, color: AppColors.primaryColor),
              Text(
                ' ${time.day}/${time.month}/${time.year}',
                style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const Spacer(),
              InkWell(
                onTap: func,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Text(
                    'Check',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
