import 'package:bookly/core/utils/Routing.dart';
import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/presentation/view/widget/bookRating_BestSellerItem.dart';
import 'package:bookly/features/Home/presentation/view/widget/customBookImage_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListviewItem extends StatelessWidget {
  const BestSellerListviewItem({Key? key, required this.bookModel}) : super(key: key);

  final Bookmodel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routerbuild.kBookDetailsScreen,extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBookImage_item(imageLink: bookModel.volumeInfo!.imageLinks!.thumbnail,aspectRatioOfPhoto: 3/4,borderRadiusOfPhoto: 10,),
/*
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                      Assetsdata.bookPicture,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
*/
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    bookModel.volumeInfo!.title ?? "Harry potter and the goblet of the Fire",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    bookModel.volumeInfo!.authors![0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14
                        .copyWith(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                       "Free",
                        // '200 \$',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20,
                      ),
                      Spacer(),
                      bookRating(ratingCount: 2083, avgRating: 4,),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
