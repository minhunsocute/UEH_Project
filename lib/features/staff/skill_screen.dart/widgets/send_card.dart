import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_color.dart';

class SendCard extends StatelessWidget {
  final String title;
  final int typeMess;
  final DateTime time;
  const SendCard({
    Key? key,
    required this.title,
    required this.typeMess,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          (typeMess == 0)
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.72,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(5),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor.withOpacity(0.7),
                        AppColors.primaryColor,
                        AppColors.primaryColor,
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.72 - 90,
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                DateFormat().add_jm().format(time),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(15.0),
                  width: MediaQuery.of(context).size.width * 0.72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor.withOpacity(0.7),
                        AppColors.primaryColor,
                        AppColors.primaryColor,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.textColor.withOpacity(0.2),
                                    blurRadius: 4.0),
                              ],
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/person.png")),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Build Wireframe",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                DateFormat().add_jm().format(time),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textColor.withOpacity(0.3),
                              blurRadius: 3.0,
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(title),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
