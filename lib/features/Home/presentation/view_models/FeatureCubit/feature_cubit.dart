import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/data/Repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit(this.home_repo) : super(FeatureInitial());

  home_repository? home_repo;
  List<Bookmodel>? FeatureBooks;

  static FeatureCubit get(context) => BlocProvider.of(context);

  /*Future<void>*/
  getFeatureBooks() async {
    emit(GetFeatureBookLoading());
    var result = await home_repo!.getFeatureBooks();
    result.fold((error) {
      return emit(GetFeatureBookFailure(error: error.errormessage));
    }, (books) {
      /*books.forEach((element) {
        FeatureBooks!.add(element);
        print(element.id);

      });*/
      FeatureBooks=[];
      FeatureBooks = books;

      /*print(books[0].id);*/
      // FeatureBooks!.addAll(books);
      return emit(GetFeatureBookSuccess());
    });
  }
}
