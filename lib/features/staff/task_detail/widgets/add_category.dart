import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});
  final _nameCateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(text: 'Add', onTap: () {}),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.close, color: AppColors.textColor),
        ),
        title: const Text(
          'Add New Category',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category Name',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                controller: _nameCateController,
                hintText: 'Category Name',
                icon: Icons.category,
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category Icon',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: AppColors.colorBlack1.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'Choose Icon',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category Color',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ]),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...FakeData().listColor.map(
                      (e) => InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: e.withOpacity(0.8),
                          ),
                        ),
                      ),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
