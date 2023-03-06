import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class errorWidgetHandler extends StatelessWidget {
  errorWidgetHandler({Key? key, required this.error}) : super(key: key);
  String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: Styles.textStyle20,
      ),
    );
  }
}
