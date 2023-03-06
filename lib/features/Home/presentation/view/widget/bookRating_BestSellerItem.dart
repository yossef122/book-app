import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bookRating extends StatelessWidget {
  const bookRating({Key? key, required this.avgRating, required this.ratingCount}) : super(key: key);
  final int? avgRating;
  final int? ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 14,
        ),
        const SizedBox(
          width: 8,
        ),
         Text(
          "$avgRating" ,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '(${ratingCount??0})',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle14.copyWith(color: Colors.grey,fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
