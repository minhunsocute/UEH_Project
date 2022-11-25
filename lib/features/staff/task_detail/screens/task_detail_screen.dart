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

import '../widgets/bottom_delete.dart';
import '../widgets/edit_time.dart';
import '../widgets/editt_category.dart';
import '../widgets/row_data_item.dart';

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
