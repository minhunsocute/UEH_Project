import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ueh_project/features/staff/calender_project_view_screen/screens/project_view_screen.dart';

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

List<Map<String, dynamic>> listSelect = [
  {
    "title": "All",
    "no": 15,
    "i": 0,
  },
  {
    "title": "Completed",
    "no": 12,
    "i": 1,
  },
  {
    "title": "Inprocess",
    "no": 10,
    "i": 2,
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
  RxBool checkPage = true.obs;
  RxInt checkSelect = 0.obs;
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Obx(
                () => Text(
                  checkPage.value ? 'Calender ' : 'All Project ',
                  style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () => checkPage.value = !checkPage.value,
                child: const Icon(
                  Icons.change_circle,
                  color: AppColors.primaryColor,
                  size: 25.0,
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
                onTap: () {},
                child:
                    const Icon(Icons.more_horiz, color: AppColors.textColor)),
            const SizedBox(width: 10.0),
          ],
        ),
        body: Obx(
          () => checkPage.value
              ? ListView(
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
                                  Icon(Icons.calendar_month,
                                      color: AppColors.textColor),
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
                        members: const [
                          'Sun',
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat'
                        ],
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
                      lastDate:
                          DateTime.now().add(const Duration(days: 365 * 4)),
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                      leftMargin: 20,

                      monthColor: AppColors.textColor,
                      dayColor: AppColors.textColor,
                      activeDayColor: Colors.white,
                      activeBackgroundDayColor:
                          AppColors.primaryColor.withOpacity(0.7),
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
                              onTap: () =>
                                  checkSwap.value = 1 - checkSwap.value,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color:
                                      AppColors.primaryColor.withOpacity(0.6),
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
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  children: [
                    const SizedBox(height: 10.0),
                    Obx(
                      () => Row(
                        children: [
                          ...listSelect.map(
                            (e) => SelectItem(
                              data: e,
                              callback: () => checkSelect.value = e['i'],
                              check: checkSelect.value == e['i'],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AllProjectItem(
                      widthDevice: widthDevice,
                      title: "Endera Projct",
                      category: "High",
                      description:
                          'Lorem ipsum is simply dummy text of the printing and typesetting indsutry Lorem ipsum',
                      prgress: 0.3,
                    ),
                    AllProjectItem(
                      widthDevice: widthDevice,
                      title: "Android Project",
                      category: "High",
                      description:
                          'Lorem ipsum is simply dummy text of the printing and typesetting indsutry Lorem ipsum',
                      prgress: 0.2,
                    ),
                  ],
                ),
        ));
  }
}

class AllProjectItem extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final double prgress;
  const AllProjectItem({
    Key? key,
    required this.widthDevice,
    required this.title,
    required this.category,
    required this.description,
    required this.prgress,
  }) : super(key: key);

  final double widthDevice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => ProjectViewScreen(),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: AppColors.shadowWidget,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '$title ',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red.withOpacity(0.2),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_vert,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              description,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Progress',
                    style:
                        TextStyle(color: AppColors.textColor, fontSize: 16.0)),
                Text(
                  '${prgress * 100}%',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Stack(
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
                  width: (widthDevice - 20) * prgress,
                  height: 7.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Stack(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          boxShadow: AppColors.shadowWidget,
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/person.png'),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          boxShadow: AppColors.shadowWidget,
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/person1.png'),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 40.0),
                        decoration: BoxDecoration(
                          boxShadow: AppColors.shadowWidget,
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/person2.png'),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 60.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: AppColors.shadowWidget,
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Text(
                          '+2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      FontAwesomeIcons.clock,
                      color: AppColors.textColor,
                      size: 16.0,
                    ),
                    Text(
                      ' 3 days ago',
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

class SelectItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback callback;
  final bool check;
  const SelectItem({
    Key? key,
    required this.data,
    required this.callback,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: callback,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: check ? AppColors.textColor : Colors.white,
            border: Border.all(
              width: 1,
              color: AppColors.textColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '${data['title']} ',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: check ? Colors.white : AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Text(
                  data['no'].toString(),
                  style: TextStyle(
                    color: check ? Colors.white : AppColors.textColor,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
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
