import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class TempleteField extends StatelessWidget {
  final Widget child;
  const TempleteField({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: AppColors.shadowWidget,
        color: Colors.white,
      ),
      child: child,
    );
  }
}
