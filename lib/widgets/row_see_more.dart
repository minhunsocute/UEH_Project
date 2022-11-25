import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class RowSeeMore extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const RowSeeMore({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          InkWell(
            onTap: callback,
            child: const Text(
              'See More',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
