import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_password_field.dart';

class DialogChangePassword extends StatelessWidget {
  DialogChangePassword({
    Key? key,
  }) : super(key: key);
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: AppColors.shadowWidget),
      child: Column(children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Change Account Password',
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
        CusomPasswordField(
          controller: _oldPassword,
          hintText: "Enter your Password",
        ),
        const SizedBox(height: 10.0),
        CusomPasswordField(
          controller: _newPassword,
          hintText: "Enter new Password",
        ),
        const SizedBox(height: 10.0),
        CusomPasswordField(
          controller: _rePasswordController,
          hintText: "Enter new Password again",
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Cancle',
                onTap: () => Get.back(),
                backgroundColor: Colors.white,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(child: CustomButton(text: 'Update', onTap: () {}))
          ],
        ),
      ]),
    );
  }
}
