import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback func;
  const ProfileItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: func,
        child: Row(
          children: [
            Icon(icon, color: AppColors.textColor),
            Text(
              ' $title',
              style: const TextStyle(color: AppColors.textColor, fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,
                color: AppColors.textColor, size: 19.0),
          ],
        ),
      ),
    );
  }
}
