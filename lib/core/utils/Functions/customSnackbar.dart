import 'package:flutter/material.dart';

customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Can\'t open $text'),
    ),
  );
}
