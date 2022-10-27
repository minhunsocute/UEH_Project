import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';

class SkillScreen extends StatelessWidget {
  SkillScreen({super.key});
  RxInt checkPage = 1.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Obx(
          () => Text(
            checkPage.value == 0 ? 'List Skills to improve' : 'Message',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => checkPage.value = 1 - checkPage.value,
              icon: const Icon(Icons.change_circle, color: AppColors.textColor))
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
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.colorBlack1.withOpacity(0.6),
              border: Border.all(
                width: 1,
                color: AppColors.textColor,
              ),
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
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Obx(
            () => checkPage.value == 0
                ? Column(
                    children: [
                      SkillImproveCard1(
                        title: 'Coding Skills',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                        time: DateTime.now(),
                      ),
                      SkillImproveCard1(
                        title: 'English Skills',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                        time: DateTime.now(),
                      ),
                      SkillImproveCard1(
                        title: 'Physics Skills',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec magna nisi, consectetur vel ligula at, aliquet facilisis urna. Integer vestibulum mi vel lorem pretium, et rhoncus odio cursus. Nullam euismod euismod viverra. Donec non hendrerit diam. Maecenas sapien ex, mattis vel faucibus sed, pulvinar vitae elit. Proin fringilla risus et augue mattis ultrices. Vestibulum vel felis felis',
                        time: DateTime.now(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      MessItem(
                        image: 'assets/images/person.png',
                        name: 'Nguyen Minh Hung',
                        lassMessage: 'Hello Bro! Nice to meet you',
                        time: DateTime.now(),
                      ),
                      MessItem(
                        image: 'assets/images/person1.png',
                        name: 'Truong Huynh Duc Hoang',
                        lassMessage: 'Hello Bro! Nice to meet you',
                        time: DateTime.now(),
                      ),
                      MessItem(
                        image: 'assets/images/person2.png',
                        name: 'NGuyen Trung Hieu',
                        lassMessage: 'Hello Bro! Nice to meet you',
                        time: DateTime.now(),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class MessItem extends StatelessWidget {
  final String image;
  final String name;
  final String lassMessage;
  final DateTime time;
  const MessItem({
    Key? key,
    required this.image,
    required this.name,
    required this.lassMessage,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: AppColors.textColor.withOpacity(0.7),
                    blurRadius: 10.0),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Text(
                  lassMessage,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                )
              ],
            ),
          ),
          SizedBox(
            width: 90.0,
            child: Row(
              children: [
                const Icon(Icons.timelapse_outlined,
                    color: AppColors.primaryColor, size: 20.0),
                Expanded(
                  child: Text(
                    ' ${time.day}/${time.month}/${time.year}',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
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

class SkillImproveCard1 extends StatelessWidget {
  final String title;
  final String description;
  final DateTime time;
  const SkillImproveCard1({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.colorBlack1.withOpacity(0.6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Text(
                  description,
                  maxLines: 3,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    const Icon(Icons.timelapse, color: AppColors.primaryColor),
                    Text(
                      ' ${time.day}/${time.month}/${time.year}',
                      style: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
