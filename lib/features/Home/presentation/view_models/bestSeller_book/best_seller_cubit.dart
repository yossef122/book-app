import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/data/Repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.home_repo) : super(BestSellerInitial());

  home_repository? home_repo;

  List<Bookmodel>? BestSellerbooks;

  static BestSellerCubit get(context) => BlocProvider.of(context);

  Future<void> getBestSellerBooks() async {
    emit(GetBestSellerBookLoading());
    var result = await home_repo!.getFeatureBooks();
    result.fold(
      (error) {
        return emit(GetBestSellerBookFailure(error: error.errormessage));
      },
      (books) {
        BestSellerbooks=[];
        BestSellerbooks = books;
        return emit(GetBestSellerBookSuccess());
      },
    );
  }
}
