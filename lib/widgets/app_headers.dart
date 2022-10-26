import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset('assets/images/app_icon.png'),
        ),
        const SizedBox(width: 5),
        RichText(
          text: const TextSpan(
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 14),
            children: [
              TextSpan(
                  text: 'Hello, I am ',
                  style: TextStyle(
                      fontFamily: 'Montserrat', color: AppColors.textColor)),
              TextSpan(
                text: 'Todo App',
                style: TextStyle(
                    // fontFamily: 'Montserrat',
                    color: Colors.purple,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ],
    );
  }
}
