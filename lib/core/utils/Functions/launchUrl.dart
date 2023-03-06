import 'package:bookly/core/utils/Functions/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlContent(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      !await launchUrl(uri);
      // throw Exception('Could not launch $_url');
    } else {
      customSnackBar(context,url);
    }
  }
}
