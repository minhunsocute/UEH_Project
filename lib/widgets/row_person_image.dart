import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class RowPersonImage extends StatelessWidget {
  const RowPersonImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
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
              border: Border.all(color: Colors.white, width: 1),
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
              border: Border.all(color: Colors.white, width: 1),
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
              border: Border.all(color: Colors.white, width: 1),
              boxShadow: AppColors.shadowWidget,
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: const Text(
              '+2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowPersonImage1 extends StatelessWidget {
  final List<String> image;
  const RowPersonImage1({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          for (int i = 0; i < image.length; i++)
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.only(left: i * 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                boxShadow: AppColors.shadowWidget,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image[i]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
