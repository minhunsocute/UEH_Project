import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ueh_project/constants/fake_data.dart';
import 'package:ueh_project/widgets/custom_text_field.dart';

import '../../../../constants/app_color.dart';
import '../../../../widgets/custom_button.dart';
import 'package:readmore/readmore.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
            text: 'Delete Task',
            onTap: () async {
              await showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (builder) => BottomDelete(),
              );
            },
            backgroundColor: Colors.red),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Do Maths Homework',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green.withOpacity(0.4),
                    ),
                    child: const Text(
                      'Task Done',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Do chaper 2 to 5 for next week',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.primaryColor,
                    ),
                    child: const Text(
                      'Change Title',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ReadMoreText(
              'Doctors, also known as physicians, are licensed health professionals who maintain and restore human health through the practice of medicine. They examine patients, review their medical history, diagnose illnesses or injuries, administer treatment, and counsel patients on their health and well-being.',
              trimLines: 4,
              style: TextStyle(color: AppColors.textColor),
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          RowDataItem(
            title: 'Task Time',
            data: const Text(
              'Today At 16:45',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            func: () => Get.to(() => EditTime()),
            icon: Icons.timelapse,
          ),
          RowDataItem(
            title: 'Task Category',
            data: Row(
              children: const [
                Icon(Icons.work, color: Colors.blue),
                Text(
                  ' Work',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            func: () => Get.to(() => EditCategory()),
            icon: Icons.document_scanner_outlined,
          ),
        ],
      ),
    );
  }
}

class RowDataItem extends StatelessWidget {
  final String title;
  final Widget data;
  final VoidCallback func;
  final IconData icon;
  const RowDataItem({
    Key? key,
    required this.title,
    required this.data,
    required this.func,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor),
          Text(
            ' $title',
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          const Spacer(),
          InkWell(
            onTap: func,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppColors.colorBlack1.withOpacity(0.7),
              ),
              child: data,
            ),
          ),
        ],
      ),
    );
  }
}

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

class EditTime extends StatefulWidget {
  const EditTime({super.key});

  @override
  State<EditTime> createState() => _EditTimeState();
}

class _EditTimeState extends State<EditTime> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  Rx<DateTime> time = DateTime(2016, 5, 10, 22, 35).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(text: 'Update', onTap: () {}),
      ),
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.close, color: AppColors.textColor),
        ),
        title: const Text(
          'Edit Time',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 22.0),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose Date',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.colorBlack1.withOpacity(0.6),
            ),
            child: TableCalendar(
              rowHeight: 40.0,
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.redAccent[100],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                markerDecoration: const BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                todayDecoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                todayTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                weekendTextStyle: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                defaultTextStyle: const TextStyle(
                  color: AppColors.textColor,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                weekendStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              headerStyle: HeaderStyle(
                leftChevronIcon:
                    const Icon(Icons.chevron_left, color: AppColors.textColor),
                rightChevronIcon:
                    const Icon(Icons.chevron_right, color: AppColors.textColor),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.redAccent[100],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // daysOfWeekStyle: TextStyle(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose Time',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.colorBlack1.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                width: double.infinity,
                height: 100,
                child: CupertinoDatePicker(
                  // dateOrder: DatePickerDateOrder.dmy,
                  initialDateTime: time.value,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() => time.value = newTime);
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class BottomDelete extends StatelessWidget {
  BottomDelete({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      // padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: AppColors.colorBlack1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 80,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.textColor.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Delete Task',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text('Are you sure you want to Delete?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: AppColors.textColor),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Cancle',
                    onTap: () => Get.back(),
                    backgroundColor: AppColors.colorBlack1,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(child: CustomButton(text: 'Delete', onTap: () {}))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
