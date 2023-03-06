import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/presentation/view/widget/Book_details_appBar.dart';
import 'package:bookly/features/Home/presentation/view/widget/BooksDetailsFirstSections.dart';
import 'package:bookly/features/Home/presentation/view/widget/BooksDetails_SecondSectionBottom.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookmodel}) : super(key: key);
  final Bookmodel bookmodel ;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children:  [
                const Book_details_appBar(),
                BooksDetailsFirstSections(bookmodel: bookmodel,),
                const Expanded(
                  child:  SizedBox(
                    height: 16,
                  ),
                ),
                const BooksDetailsSecondSectionBottom(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
