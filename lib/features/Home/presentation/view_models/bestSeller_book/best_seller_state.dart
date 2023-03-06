part of 'best_seller_cubit.dart';

// @immutable

abstract class BestSellerState {}

class BestSellerInitial extends BestSellerState {}


class GetBestSellerBookLoading extends BestSellerState {}

class GetBestSellerBookSuccess extends BestSellerState {}

class GetBestSellerBookFailure extends BestSellerState {
  final String error;
  GetBestSellerBookFailure({required this.error});
}
