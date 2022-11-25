import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';

class DialogChangeName extends StatelessWidget {
  DialogChangeName({
    Key? key,
  }) : super(key: key);
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: Get.height / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: AppColors.shadowWidget),
      child: Column(children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Change Account Name',
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
        CustomTextField(
            controller: _nameController,
            hintText: "Enter new Name",
            icon: Icons.person),
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
