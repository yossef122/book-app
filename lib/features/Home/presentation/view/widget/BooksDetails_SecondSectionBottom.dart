import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/Home/presentation/view/widget/bookDetailsBottomListView.dart';
import 'package:flutter/material.dart';

class BooksDetailsSecondSectionBottom extends StatelessWidget {
  const BooksDetailsSecondSectionBottom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also read',
          style: Styles.textStyle14
              .copyWith(fontWeight: FontWeight.w600),
        ),

        const SizedBox(
          height: 15,
        ),
        const bookDetailsBottomListView(),
      ],
    );
  }
}