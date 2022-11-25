import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/custom_button.dart';

class BottomDelete extends StatelessWidget {
  BottomDelete({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      // padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 80,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.textColor.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Delete Task',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text('Are you sure you want to Delete?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Cancle',
                    onTap: () => Get.back(),
                    backgroundColor: Colors.white,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(child: CustomButton(text: 'Delete', onTap: () {}))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
