import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';
import '../widgets/recieve_card.dart';
import '../widgets/send_card.dart';

class MessPersonScreen extends StatelessWidget {
  MessPersonScreen({super.key});
  final TextEditingController messController = TextEditingController();
  RxList<Map<String, dynamic>> listMess = [
    {
      'title': 'Hi Team, I just mode the latest wireform update please check',
      'rs': 0,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Wow. I have checked your work. I like it very much ',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Ok let\'t do it',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'assets/images/person.png',
      'rs': 0,
      'typeMess': 1,
      'date': DateTime.now(),
    },
    {
      'title': 'Hahahahaha it\'t so funny',
      'rs': 0,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'assets/images/person1.png',
      'rs': 1,
      'typeMess': 1,
      'date': DateTime.now(),
    },
    {
      'title': 'Let\'t meet tomrrow',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'We will talk about this project',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    }
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryColor[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor[300],
        leading: InkWell(
          onTap: () => Get.back(),
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 50,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.3),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.textColor,
              size: 14,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              'Truong Huynh Duoc Hoang',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: const Text(
                'Online',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.all(10),
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
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.primaryColor[300],
          ),
          Obx(
            () => Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textColor,
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.white,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  const SizedBox(height: 20),
                  LocateTime(
                    date: DateTime.now().subtract(
                      const Duration(days: 1),
                    ),
                  ),
                  ...listMess.value.map((e) => (e['rs'] == 0)
                      ? SendCard(
                          title: e['title'],
                          typeMess: e['typeMess'],
                          time: e['date'])
                      : ReciveCard(
                          title: e['title'],
                          typeMess: e['typeMess'],
                          time: e['date'])),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          _inputField(),
        ],
      ),
    );
  }

  Align _inputField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        // color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.backgroundColor.withOpacity(0.2),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: messController,
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          autocorrect: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type Message',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                      height: 40,
                      child: InkWell(
                        // onTap: () => sendMess,
                        child: Icon(Icons.camera_alt_outlined,
                            color: AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: AppColors.textColor.withOpacity(0.4),
                          blurRadius: 4.0),
                    ], color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocateTime extends StatelessWidget {
  const LocateTime({
    Key? key,
    required this.date,
  }) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: AppColors.textColor),
        ),
        child: Text(
          (date.year == now.year &&
                  date.month == now.month &&
                  date.day == now.day)
              ? 'Today'
              : DateFormat().add_MEd().format(date),
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
