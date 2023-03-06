import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/presentation/view/widget/bookRating_BestSellerItem.dart';
import 'package:bookly/features/Home/presentation/view/widget/button_Action.dart';
import 'package:bookly/features/Home/presentation/view/widget/customBookImage_item.dart';
import 'package:flutter/material.dart';

class BooksDetailsFirstSections extends StatelessWidget {
  const BooksDetailsFirstSections({Key? key, required this.bookmodel}) : super(key: key);
  final Bookmodel bookmodel ;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .23),
          child:  customBookImage_item(imageLink:bookmodel.volumeInfo!.imageLinks!.smallThumbnail ,),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(

          bookmodel.volumeInfo?.title ?? ' ',
          style: Styles.textStyle30
              .copyWith(fontSize: 28, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 7,
        ),
        Opacity(
          opacity: .6,
          child: Text(
            bookmodel.volumeInfo?.authors?[0]??' ',
            style: Styles.textStyle18
                .copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const bookRating(ratingCount: 2083, avgRating: 4,),
        const SizedBox(
          height: 20,
        ),
         buttonAction(bookmodel: bookmodel,),
      ],
    );
  }
}
