import 'package:flutter/material.dart';
import 'package:ueh_project/widgets/custom_button.dart';
import 'package:ueh_project/widgets/custom_text_field.dart';

import '../../../constants/app_color.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  // final controller = Get.find<SignInC>();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Forgot Password',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Oops. It happens to the best of us. Input your emaill address to fix th e issue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/gmail.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 60),
              Container(
                alignment: Alignment.topCenter,
                height: 230,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    icon: Icons.email,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          offset: const Offset(2, 3),
                          blurRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          offset: const Offset(-2, -3),
                          blurRadius: 2,
                        )
                      ],
                    ),
                    child: CustomButton(text: 'Submit', onTap: () {})),
              )
            ],
          ),
        ),
      ),
    );
  }
}
