import 'package:bookly/core/Widget/Custom_Button.dart';
import 'package:bookly/core/utils/Functions/launchUrl.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class buttonAction extends StatelessWidget {
  const buttonAction({Key? key, required this.bookmodel}) : super(key: key);
  final Bookmodel bookmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Custom_Button(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: Custom_Button(
              text: getText(bookmodel),
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textColor: Colors.white,
              onPressed: () async {
               /* Uri _url = Uri.parse(bookmodel.volumeInfo!.previewLink!);
                if (await canLaunchUrl(_url)) {
                  !await launchUrl(_url);
                  // throw Exception('Could not launch $_url');
                }*/
                launchUrlContent(context,/*bookmodel.volumeInfo!.previewLink!*/'https//www.yahooo.com');
/*
                print("hello");
*/
              },
            ),
          ),
        ],
      ),
    );
  }
}

String getText(Bookmodel bookModel) {
  if (bookModel.volumeInfo?.previewLink == null) {
    return 'not available';
  }
  return 'preview';
}

