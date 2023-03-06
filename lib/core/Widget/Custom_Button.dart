// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  // const Custom_Button({Key? key}) : super(key: key);
  String text = '';
  var backgroundColor = Colors.white;
  var borderRadius;

  var textColor = Colors.black;
  void Function()? onPressed;
  Custom_Button({
    required this.text,
    required this.backgroundColor,
    this.borderRadius,
    required this.textColor,
     /*void Function()?*/ this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
