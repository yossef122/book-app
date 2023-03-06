import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/data/Repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.home_repo}) : super(SimilarBooksInitial());

  home_repository? home_repo;
  List<Bookmodel>? SimilarBook;

  static SimilarBooksCubit get(context) => BlocProvider.of(context);

  /*Future<void>*/
  getSimilarBook({required String category}) async {
    emit(GetSimilarBooksLoading());
    var result = await home_repo!.getSimilarBook(category: category);
    result.fold((error) {
      return emit(GetSimilarBooksFailure(error: error.errormessage));
    }, (books) {
      SimilarBook=[];
      SimilarBook = books;
      // print( SimilarBook?[0].volumeInfo?.categories?[0]);

      return emit(GetSimilarBooksSuccess());
    });
  }
}
