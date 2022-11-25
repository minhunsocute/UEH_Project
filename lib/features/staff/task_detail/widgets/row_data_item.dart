import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class RowDataItem extends StatelessWidget {
  final String title;
  final Widget data;
  final VoidCallback func;
  final IconData icon;
  const RowDataItem({
    Key? key,
    required this.title,
    required this.data,
    required this.func,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor),
          Text(
            ' $title',
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          const Spacer(),
          InkWell(
            onTap: func,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: AppColors.shadowWidget,
              ),
              child: data,
            ),
          ),
        ],
      ),
    );
  }
}
