import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';

class DialogChangeImage extends StatelessWidget {
  DialogChangeImage({
    Key? key,
  }) : super(key: key);
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: Get.height / 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: AppColors.shadowWidget),
      child: Column(children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Change Account Image',
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        const Divider(color: Colors.grey),
        const SizedBox(height: 10.0),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Tack Picture',
              style: TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Import from fallery',
              style: TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ]),
    );
  }
}
