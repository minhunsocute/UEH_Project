import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class RowInforTask extends StatelessWidget {
  final IconData icon;
  final String mainTitle;
  final Widget widget;
  const RowInforTask({
    Key? key,
    required this.icon,
    required this.mainTitle,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.textColor,
                ),
                Text(
                  ' $mainTitle',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: widget,
          ),
        ],
      ),
    );
  }
}
