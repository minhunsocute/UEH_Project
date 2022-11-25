import 'package:flutter/material.dart';

class FakeData {
  List<Map<String, dynamic>> listCategory = [
    {
      'icon': Icons.home,
      'title': 'Home',
      'color1': Colors.blue,
      'color2': Colors.blue.withOpacity(0.3),
    },
    {
      'icon': Icons.work,
      'title': 'Work',
      'color1': Colors.red,
      'color2': Colors.red.withOpacity(0.3),
    },
    {
      'icon': Icons.design_services,
      'title': 'Design',
      'color1': Colors.orange,
      'color2': Colors.orange.withOpacity(0.3),
    },
    {
      'icon': Icons.computer,
      'title': 'Coding',
      'color1': Colors.green,
      'color2': Colors.green.withOpacity(0.3),
    },
    {
      'icon': Icons.book,
      'title': 'Course',
      'color1': Colors.purple,
      'color2': Colors.purple.withOpacity(0.3),
    },
  ];

  List<Color> listColor = [
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.white,
    Colors.pink
  ];
  static const List<int> topData = [6, 5, 4, 3, 2, 1];
}

List<Map<String, dynamic>> listLessons = [
  {
    'title': 'She is polite and quite',
    'hour': 2,
    'minute': 30,
    'check': true,
  },
  {
    'title': 'What is he like',
    'hour': 5,
    'minute': 30,
    'check': false,
  },
  {
    'title': 'UI/UX Designer',
    'hour': 2,
    'minute': 30,
    'check': false,
  },
  {
    'title': 'Machine Learning ',
    'hour': 1,
    'minute': 30,
    'check': false,
  },
  {
    'title': 'Information Technology',
    'hour': 6,
    'minute': 30,
    'check': false,
  },
];

List<String> listSkillImprove = [
  'Coding Skill',
  'Interview Skill',
  'Design Skill',
  'Data Design Skill',
];
