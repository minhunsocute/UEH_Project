import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class CusomPasswordField extends StatefulWidget {
  const CusomPasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  State<CusomPasswordField> createState() => _CusomPasswordFieldState();
}

class _CusomPasswordFieldState extends State<CusomPasswordField> {
  bool checkShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                checkShow = !checkShow;
              });
            },
            child: Container(
              width: 50,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: Icon(
                (checkShow) ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              obscureText: checkShow,
              controller: widget.controller,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
