import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:ueh_project/widgets/custom_password_field.dart';
import 'package:ueh_project/widgets/custom_text_field.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/line_chaer_design.dart';
import '../widgets/over.dart';
import '../widgets/profile_item.dart';
import '../widgets/template_field.dart';
import 'dialog_change_image.dart';
import 'dialog_change_name.dart';
import 'dialog_change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Over(
        widthDevice: Get.width,
        heightDevice: Get.height,
        listView: Column(
          children: [
            _headerField(),
            TempleteField(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Activity Chart View',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          // await _showDatePicker(context: context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primaryColor.withOpacity(0.5),
                          ),
                          child: const Text(
                            'Select Year',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  // const Spacer(),
                  // GitHubCalenderBuit(fakeDataCommit: fakeDataCommit)
                  const SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: LineChartDesign(
                      listData: [
                        FlSpot(0, 3),
                        FlSpot(1, 2),
                        FlSpot(2, 5),
                        FlSpot(3, 3.1),
                        FlSpot(4, 4),
                        FlSpot(5, 3),
                        FlSpot(6, 4),
                        FlSpot(7, 3),
                        FlSpot(8, 2),
                        FlSpot(9, 5),
                        FlSpot(10, 3.1),
                        FlSpot(11, 4),
                      ],
                    ),
                  ),
                  // gitHubCommitField()
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            TempleteField(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 10.0),
                ProfileItem(
                  title: 'App Settings',
                  func: () {},
                  icon: Icons.settings_outlined,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Accounts',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 10.0),
                ProfileItem(
                  title: 'Change Account name',
                  func: () async => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: DialogChangeName(),
                    ),
                  ),
                  icon: Icons.person_outlined,
                ),
                ProfileItem(
                  title: 'Change Account Password',
                  func: () async => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: DialogChangePassword(),
                    ),
                  ),
                  icon: Icons.key,
                ),
                ProfileItem(
                  title: 'Change Account Image',
                  func: () async => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: DialogChangeImage(),
                    ),
                  ),
                  icon: Icons.camera_alt_sharp,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Uptodo',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 10.0),
                ProfileItem(
                  title: 'Support US',
                  func: () {},
                  icon: Icons.favorite,
                ),
                ProfileItem(
                  title: 'Contact Us',
                  func: () {},
                  icon: Icons.people,
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.logout_outlined, color: Colors.red),
                        Text(
                          ' Log Out',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.red, size: 19.0),
                      ],
                    ),
                  ),
                )
              ],
            )),
            const SizedBox(height: 40.0)
          ],
        ),
      ),
    );
  }

  SizedBox _headerField() {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 100),
              SizedBox(
                child: Column(
                  children: [
                    Badge(
                      position: BadgePosition.topStart(
                        top: -45,
                        start: (Get.mediaQuery.size.width - 40) / 2 - 45,
                      ),
                      badgeColor: Colors.white,
                      padding: const EdgeInsets.all(10),
                      stackFit: StackFit.passthrough,
                      elevation: 0,
                      badgeContent: Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/person.png',
                            ),
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Nguyen Minh Hung',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            _typeColumn(
                                                data: '759', title: 'Tasks'),
                                            Container(
                                              height: 30,
                                              width: 1,
                                              color: AppColors.textColor,
                                            ),
                                            _typeColumn(
                                                data: '35',
                                                title: 'Tasks Done'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _typeColumn({required String data, required String title}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}
