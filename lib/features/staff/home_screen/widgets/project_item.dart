import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/app_color.dart';

class ProjectListItem extends StatelessWidget {
  final String mainTitle;
  final double progress;
  final int message;
  final int day;
  final bool checkHeader;
  const ProjectListItem({
    Key? key,
    required this.mainTitle,
    required this.progress,
    required this.message,
    required this.day,
    required this.checkHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 160,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: (checkHeader) ? AppColors.primaryColor : Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.3),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  mainTitle,
                  style: TextStyle(
                    color: checkHeader ? Colors.white : AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
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
                    color: checkHeader ? Colors.white : Colors.black,
                  ),
                  child: Text(
                    '+2',
                    style: TextStyle(
                      color:
                          checkHeader ? AppColors.primaryColor : Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress',
                  style: TextStyle(
                      color: checkHeader ? Colors.white : AppColors.textColor,
                      fontSize: 16.0)),
              Text(
                '${progress * 100}%',
                style: TextStyle(
                  color: checkHeader ? Colors.white : AppColors.textColor,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Stack(
            children: [
              Container(
                width: 180,
                height: 7.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: checkHeader
                      ? Colors.white.withOpacity(0.3)
                      : Colors.black.withOpacity(0.1),
                ),
              ),
              Container(
                width: 180 * progress,
                height: 7.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.facebookMessenger,
                    color: checkHeader ? Colors.white : AppColors.textColor,
                    size: 16.0,
                  ),
                  Text(
                    ' $message',
                    style: TextStyle(
                      color: checkHeader ? Colors.white : AppColors.textColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.clock,
                    color: checkHeader ? Colors.white : AppColors.textColor,
                    size: 16.0,
                  ),
                  Text(
                    ' $day days ago',
                    style: TextStyle(
                      color: checkHeader ? Colors.white : AppColors.textColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
