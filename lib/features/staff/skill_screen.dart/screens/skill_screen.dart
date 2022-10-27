import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          'List Skills to improve',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        actions: [
          IconButton(
              onPressed: () {},
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
        ],
      ),
    );
  }
}
