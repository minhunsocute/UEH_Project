import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ueh_project/constants/app_color.dart';
import 'package:ueh_project/features/staff/calender_project_view_screen/screens/task_with_another_screen.dart';

import '../../../../widgets/chart_2_column.dart';
import '../../../../widgets/row_person_image.dart';

class ProjectViewScreen extends StatelessWidget {
  ProjectViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          _headerProject(heightDevice),
          const SizedBox(height: 20.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Tiki Mobile Project',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Lorem ipsum is simply dummy text of the printing and typesetting indsutry Lorem ipsum',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor.withOpacity(0.5),
                        AppColors.primaryColor.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: const Text(
                    '80/90',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '${DateFormat().add_yMMMEd().format(DateTime.now())} ${DateFormat().add_jm().format(DateTime.now())}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(
              children: [
                Container(
                  width: (widthDevice - 20),
                  height: 7.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                Container(
                  width: (widthDevice - 20) * 0.4,
                  height: 7.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          _chartField(),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'To-do',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          width: 2,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: const Text(
                        '6 Tasks',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                TaskWithAnotherItem(
                  mainTitle: 'Build Wirefram',
                  dateTime: DateTime.now(),
                ),
                TaskWithAnotherItem(
                  mainTitle: 'Fix Scroll',
                  dateTime: DateTime.now(),
                ),
                TaskWithAnotherItem(
                  mainTitle: 'Fix Layout',
                  dateTime: DateTime.now(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _chartField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: AppColors.shadowWidget,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Chart View',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.primaryColor.withOpacity(0.3),
                  ),
                  child: const Text(
                    'Week',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            height: 240,
            child: ColumnChartTwoColumnCustom(
              barGroups: [
                makeGroupData(0, 150 / 300 * 20, 60 / 300 * 20),
                makeGroupData(1, 180 / 300 * 20, 70 / 300 * 20),
                makeGroupData(2, 80 / 300 * 20, 50 / 300 * 20),
                makeGroupData(3, 230 / 300 * 20, 210 / 300 * 20),
                makeGroupData(4, 100 / 300 * 20, 80 / 300 * 20),
                makeGroupData(5, 100 / 300 * 20, 30 / 300 * 20),
                makeGroupData(6, 200 / 300 * 20, 30 / 300 * 20),
              ],
              members: const ['Hun', 'Hoa', 'Hieu', 'Ton', 'Dai', 'Nam', 'Ngu'],
              columnData: 300,
            ),
          ),
          const Divider(color: Colors.grey),
          const SizedBox(height: 5.0),
          Row(
            children: [
              RowPersonImage(),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[300],
                        ),
                      ),
                      const Text(
                        ' Complete: 30',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 248, 80, 68),
                        ),
                      ),
                      const Text(
                        ' UnComplete: 30',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _headerProject(double heightDevice) {
    return Container(
      width: double.infinity,
      height: heightDevice / 4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/shutterstock_83060329.jpg',
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        height: heightDevice / 4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.2),
              Colors.black38,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.search, color: Colors.white),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.more_horiz, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 5.0,
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/person1.png',
                      ),
                    ),
                  ),
                ),
                RowPersonImage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskWithAnotherItem extends StatelessWidget {
  final String mainTitle;
  final DateTime dateTime;
  const TaskWithAnotherItem({
    Key? key,
    required this.mainTitle,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => TaskWithAnotherScreen()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withOpacity(0.1),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainTitle,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'Due date ${DateFormat().add_yMMMEd().format(dateTime)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: AppColors.textColor,
                      ),
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: AppColors.textColor,
                      size: 13.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 5.0),
            Row(
              children: [
                const RowPersonImage(),
                const Spacer(),
                Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.facebookMessenger,
                      color: AppColors.textColor,
                      size: 16.0,
                    ),
                    Text(
                      ' 7',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                Row(
                  children: const [
                    Icon(
                      Icons.attach_file_outlined,
                      color: AppColors.textColor,
                      size: 16.0,
                    ),
                    Text(
                      ' 3 gifs',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      toY: y1,
      color: Colors.blue[300],
      width: 7,
    ),
    BarChartRodData(
      toY: y2,
      color: const Color.fromARGB(255, 248, 80, 68),
      width: 7,
    ),
  ]);
}
