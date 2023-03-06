// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class customBookImage_item extends StatelessWidget {
  const customBookImage_item(
      {Key? key,
      required this.imageLink,
      this.aspectRatioOfPhoto,
      this.borderRadiusOfPhoto})
      : super(key: key);

  final String? imageLink;
  final double? aspectRatioOfPhoto;
  final double? borderRadiusOfPhoto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * .3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusOfPhoto ?? 20),
        child: AspectRatio(
          aspectRatio: aspectRatioOfPhoto ?? 2.7 / 4,
          /*child: Container(

            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:  DecorationImage(
                image:imageLink == null ? const AssetImage(
                  Assetsdata.bookPicture,
                ):NetworkImage(imageLink!) as ImageProvider ,
                fit: BoxFit.fill,
              ),
            ),
          ),*/
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageLink!,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          ),
        ),
      ),
    );
  }
}
