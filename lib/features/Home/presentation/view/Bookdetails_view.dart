import 'package:bookly/core/utils/WebService_locator.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/data/Repository/home_Repo_implementation.dart';
import 'package:bookly/features/Home/presentation/view_models/SimilarBooks_Cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bookly/features/Home/presentation/view/widget/Bookdetails_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.bookmodel}) : super(key: key);
  final Bookmodel bookmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SimilarBooksCubit>(
        create: (context) =>
            SimilarBooksCubit(home_repo: getIt.get<homeRepoImplementation>())
              ..getSimilarBook(category: bookmodel.volumeInfo!.categories![0]),
        child:  BookDetailsViewBody(bookmodel: bookmodel,),
      ),
    );
  }
}
