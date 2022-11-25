import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ueh_project/features/staff/calender_project_view_screen/screens/calender_screen.dart';
import 'package:ueh_project/features/staff/home_screen/screens/home_screen.dart';
import 'package:ueh_project/features/staff/skill_screen.dart/screens/skill_screen.dart';

import '../../../../constants/app_color.dart';
import '../../profile/screens/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBody: true,
      body: IndexedStack(
        index: _bottomNavIndex,
        children: [
          HomeScreen(),
          CalenderScreen(),
          SkillScreen(),
          ProfileScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add, color: AppColors.textColor),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.grey,
        icons: const [
          Icons.home,
          Icons.calendar_month,
          Icons.book,
          Icons.person
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
