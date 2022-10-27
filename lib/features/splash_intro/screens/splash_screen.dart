import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_color.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_icon.png',
                height: 180, width: 180, fit: BoxFit.cover),
            const Text(
              'To do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 3),
            const CircularProgressIndicator(color: AppColors.primaryColor)
          ],
        ),
      ),
    );
  }
}
