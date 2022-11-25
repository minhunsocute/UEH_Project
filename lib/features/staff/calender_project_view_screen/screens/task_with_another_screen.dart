import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ueh_project/constants/app_color.dart';
import 'package:ueh_project/widgets/row_person_image.dart';

import '../../../../widgets/row_see_more.dart';
import '../widgets/comment_card.dart';
import '../widgets/row_info_task.dart';
import '../widgets/sub_task_item.dart';

List<Map<String, dynamic>> listInfo = [
  {
    'icon': Icons.people_outline,
    'mainTitle': 'Team',
    'widget': const RowPersonImage1(
      image: [
        'assets/images/person.png',
        'assets/images/person1.png',
        'assets/images/person2.png',
        'assets/images/person.png',
        'assets/images/person1.png',
        'assets/images/person2.png',
        'assets/images/person.png',
        'assets/images/person1.png',
        'assets/images/person2.png',
      ],
    ),
  },
  {
    'icon': Icons.person_outlined,
    'mainTitle': 'Leader',
    'widget': Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.3),
                blurRadius: 5.0,
              ),
            ],
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/person.png'),
            ),
          ),
        ),
        const Text(
          ' Nguyen Minh Hung(You)',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  },
  {
    'icon': Icons.check_box_outlined,
    'mainTitle': 'Status',
    'widget': Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 2, color: AppColors.primaryColor),
      ),
      child: const Text(
        'To-do',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    ),
  },
  {
    'icon': Icons.calendar_month_outlined,
    'mainTitle': 'Due Date',
    'widget': Text(
      ' Due Date: ${DateFormat().add_yMMMEd().format(DateTime.now())}',
      style: const TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.0),
    ),
  },
];

class TaskWithAnotherScreen extends StatelessWidget {
  const TaskWithAnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
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
          'Build Wireframe',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        actions: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const SizedBox(width: 10.0),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.more_horiz,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Container(
            margin: const EdgeInsets.all(15.0),
            width: double.infinity,
            height: heightDevice / 4 - 23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: AppColors.shadowWidget,
              image: const DecorationImage(
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
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black26,
                  ],
                ),
              ),
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ...listInfo.map((e) => RowInforTask(
                    icon: e['icon'],
                    mainTitle: e['mainTitle'],
                    widget: e['widget'])),
              ],
            ),
          ),
          // const SizedBox(height: 20.0),
          RowSeeMore(
            title: 'Sub-Tasks',
            callback: () {},
          ),
          const SizedBox(height: 10.0),
          SubTaskItem(
            mainTitle: 'Meeting with Team',
            time: DateTime.now(),
          ),
          SubTaskItem(
            mainTitle: 'Scroll List View',
            time: DateTime.now(),
          ),
          const SizedBox(height: 10.0),
          RowSeeMore(
            title: 'Comments (8)',
            callback: () {},
          ),
          const SizedBox(height: 10.0),
          const CommentCard(
            name: 'Nguyen Minh Hung',
            image: 'assets/images/person.png',
            favCount: 300,
            title: 'Doctors who are very skilled and fast in service',
            day: 8,
            star: 3,
            checkLike: true,
            check: 1,
          ),

          const CommentCard(
            name: 'Nguyen Minh Hung',
            image: 'assets/images/person1.png',
            favCount: 300,
            title: 'Doctors who are very skilled and fast in service',
            day: 8,
            star: 3,
            checkLike: true,
            check: 1,
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
