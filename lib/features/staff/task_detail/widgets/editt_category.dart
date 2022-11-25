import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/fake_data.dart';
import '../../../../widgets/custom_button.dart';
import 'add_category.dart';

class EditCategory extends StatelessWidget {
  const EditCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(text: 'Update', onTap: () {}),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.close, color: AppColors.textColor),
        ),
        title: const Text(
          'Edit Category',
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
          SizedBox(
            width: double.infinity,
            height: 300.0,
            child: GridView.count(
              primary: false,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: [
                ...FakeData().listCategory.map(
                      (e) => Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: e['color2'],
                            ),
                            child: Icon(
                              e['icon'],
                              color: e['color1'],
                            ),
                          ),
                          // const SizedBox(height: 10.0),
                          Text(
                            e['title'],
                            style: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                InkWell(
                  onTap: () => Get.to(() => AddCategory()),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.yellow.withOpacity(0.6),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.yellow,
                        ),
                      ),
                      // const SizedBox(height: 10.0),
                      const Text(
                        'Add',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
