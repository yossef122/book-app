import 'package:bookly/core/Widget/Error_Widget_handler.dart';
import 'package:bookly/core/Widget/LoadingState_Widget.dart';
import 'package:bookly/features/Home/presentation/view/widget/customBookImage_item.dart';
import 'package:bookly/features/Home/presentation/view_models/SimilarBooks_Cubit/similar_books_cubit.dart';
import 'package:bookly/features/Home/presentation/view_models/SimilarBooks_Cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class bookDetailsBottomListView extends StatelessWidget {
  const bookDetailsBottomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is GetSimilarBooksSuccess) {
          var cubit = SimilarBooksCubit.get(context).SimilarBook;
          return SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: ListView.separated(
                // padding: const EdgeInsets.only(left: 20,right: 20, bottom: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => /*const*/ customBookImage_item(
                      imageLink: cubit![index].volumeInfo?.imageLinks?.smallThumbnail
                               /*??
                          'https://images-na.ssl-images-amazon.com/images/I/41VkICdTF5L.jpg',*/
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                itemCount: cubit!.length),
          );
        } else if (state is GetSimilarBooksFailure) {
          return errorWidgetHandler(error: state.error);
        } else {
          return const LoadingStateWidget();
        }
      },
    );
  }
}
