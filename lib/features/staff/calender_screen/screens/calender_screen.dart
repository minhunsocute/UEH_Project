import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/chart_2_column.dart';
import '../../../../widgets/pub_dev/calender_setup.dart';
import '../../../../widgets/task_card.dart';

List<Map<String, dynamic>> fakeTask = [
  {
    'title': 'Do Math Homework',
    'time': DateTime.now(),
    'check': false,
    'color': Colors.red,
    'cateTitle': 'Work',
    'cateColor': Colors.red.withOpacity(0.3),
    'icon': Icons.work,
  },
  {
    'title': 'Do History Homework',
    'time': DateTime.now(),
    'check': false,
    'color': Colors.blue,
    'cateTitle': 'Home',
    'cateColor': Colors.blue.withOpacity(0.3),
    'icon': Icons.home,
  },
  {
    'title': 'Do physics Homework',
    'time': DateTime.now(),
    'check': true,
    'color': Colors.green,
    'cateTitle': 'Outside',
    'cateColor': Colors.green.withOpacity(0.3),
    'icon': Icons.home,
  }
];

class CalenderScreen extends StatefulWidget {
  CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late DateTime _selectedDate = DateTime.now().add(const Duration(days: 2));
  RxInt checkSwap = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          'Calender',
          style: TextStyle(
              color: AppColors.textColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz, color: AppColors.textColor)),
          const SizedBox(width: 10.0),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Week',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_month, color: AppColors.textColor),
                        Text(
                          ' Week',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
              members: const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
              columnData: 300,
            ),
          ),
          const SizedBox(height: 5.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor),
          ),
          const SizedBox(height: 5.0),
          CalendarTimeline(
            initialDate: _selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
            leftMargin: 20,

            monthColor: AppColors.textColor,
            dayColor: AppColors.textColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primaryColor.withOpacity(0.7),
            dotsColor: const Color(0xFF333A47),
            // selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Obx(
                  () => InkWell(
                    borderRadius: BorderRadius.circular(5.0),
                    onTap: () => checkSwap.value = 1 - checkSwap.value,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.primaryColor.withOpacity(0.6),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.change_circle_outlined,
                              color: AppColors.textColor, size: 20.0),
                          const SizedBox(width: 5.0),
                          checkSwap.value == 0
                              ? const Text('Completed',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                              : const Text(
                                  'Uncompleted',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(() => Column(
                children: [
                  ...fakeTask.map(
                    (e) => ((e['check'] && checkSwap.value == 0) ||
                            (!e['check'] && checkSwap.value == 1))
                        ? TaskCard(
                            title: e['title'],
                            time: e['time'],
                            check: e['check'],
                            color: e['color'],
                            cateTitle: e['cateTitle'],
                            cateColor: e['cateColor'],
                            icon: e['icon'])
                        : Container(),
                  ),
                ],
              )),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      toY: y1,
      color: const Color.fromARGB(255, 104, 203, 108),
      width: 7,
    ),
    BarChartRodData(
      toY: y2,
      color: const Color.fromARGB(255, 248, 80, 68),
      width: 7,
    ),
  ]);
}
