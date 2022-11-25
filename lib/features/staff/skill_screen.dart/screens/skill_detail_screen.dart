import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project/constants/app_color.dart';
import 'package:ueh_project/widgets/row_see_more.dart';

import '../../../../constants/fake_data.dart';
import '../../../../widgets/line_chaer_design.dart';
import '../../../../widgets/line_chart_3_line.dart';
import '../../../../widgets/row_person_image.dart';
import '../widgets/course_card_item.dart';
import '../widgets/review_card_custom.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SkillDetailScreen extends StatelessWidget {
  const SkillDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Coding Skill Improve',
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
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Description',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
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
                      'Review From Manager',
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
                        '6 Reviews',
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
                ReviewCardCustom(
                  title: 'Nguyen Minh Hung',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                  time: DateTime.now(),
                ),
                ReviewCardCustom(
                  title: 'Truong Huynh Duc Hoang',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                  time: DateTime.now(),
                ),
                ReviewCardCustom(
                  title: 'Nguyen Trung Hieu',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                  time: DateTime.now(),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10.0),
          RowSeeMore(
            title: "Course",
            callback: () async => await showMaterialModalBottomSheet(
              context: context,
              builder: (context) => AllCourse(),
            ),
          ),
          CourseCardItem(
            mainTitle: 'Oxford Class A',
            description: 'Student with medium frades on campus',
            price: 118,
            les: 14,
            time: DateTime.now(),
            noPeople: 25,
            rating: 4.8,
          ),
          const SizedBox(height: 20.0),
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
                'Statastis',
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
          const SizedBox(
              width: double.infinity,
              height: 240,
              child: LineChart3Line(isShowingMainData: true)),
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
                const RowPersonImage(),
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

List<Map<String, dynamic>> listFavDoctor = [
  {'name': 'Nguyen Minh Hung', 'image': 'assets/images/doctor2.png'},
  {'name': 'Duc Hoang', 'image': 'assets/images/doctor3.png'},
];

class AllCourse extends StatelessWidget {
  AllCourse({super.key});
  RxInt selectTop = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'All Course',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_horiz, color: AppColors.textColor),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: AppColors.shadowWidget,
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: AppColors.textColor),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'Search here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () async => await showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.filter,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Obx(
            () => SizedBox(
              height: 30,
              width: double.infinity,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 10),
                  for (int i = 0; i < FakeData.topData.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          selectTop.value = i;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (i == selectTop.value)
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              border: Border.all(
                                  width: 1, color: AppColors.primaryColor)),
                          child: Row(
                            children: [
                              Icon(Icons.star,
                                  color: (i == selectTop.value)
                                      ? Colors.white
                                      : AppColors.primaryColor,
                                  size: 15.0),
                              Text(
                                ' ${FakeData.topData[i]}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: (i == selectTop.value)
                                      ? Colors.white
                                      : AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: InkWell(
              onTap: () {},
              child: const Text(
                'Sort by priority',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          CourseCardItem(
            mainTitle: 'Oxford Class A',
            description: 'Student with medium frades on campus',
            price: 118,
            les: 14,
            time: DateTime.now(),
            noPeople: 25,
            rating: 4.8,
          ),
          CourseCardItem(
            mainTitle: 'Oxford Class A',
            description: 'Student with medium frades on campus',
            price: 118,
            les: 14,
            time: DateTime.now(),
            noPeople: 25,
            rating: 4.8,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
