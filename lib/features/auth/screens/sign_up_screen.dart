import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project/widgets/custom_button.dart';
import 'package:ueh_project/widgets/custom_text_field.dart';

import '../../../constants/app_color.dart';
import '../../../widgets/app_headers.dart';
import '../../../widgets/custom_password_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  // final controller = Get.put(SignUpC());
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const AppHeader(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/Checklist-rafiki 1.png',
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const Text(
                'Create your account',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _userNameController,
                hintText: 'Username',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              CusomPasswordField(
                controller: _passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 20),
              CusomPasswordField(
                controller: _rePasswordController,
                hintText: 'Re-Password',
              ),
              const SizedBox(height: 20),
              CustomButton(text: "Register", onTap: () {}),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 1,
                    color: AppColors.primaryColor,
                  ),
                  const Text(
                    ' Or Login with ',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 1,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
