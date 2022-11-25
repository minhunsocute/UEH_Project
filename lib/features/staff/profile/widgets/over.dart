import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class Over extends StatelessWidget {
  const Over({
    Key? key,
    required this.widthDevice,
    required this.heightDevice,
    required this.listView,
  }) : super(key: key);

  final double widthDevice;
  final double heightDevice;
  final Column listView;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: widthDevice,
          height: heightDevice,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: heightDevice / 2,
                  color: AppColors.primaryColor,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: heightDevice / 2,
                  color: AppColors.backgroundColor,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                          color: AppColors.backgroundColor,
                        ),
                        child: listView)
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
