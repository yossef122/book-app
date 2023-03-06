part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}


class GetSimilarBooksLoading extends SimilarBooksState {}

class GetSimilarBooksSuccess extends SimilarBooksState {}

class GetSimilarBooksFailure extends SimilarBooksState {
  final String error;
  GetSimilarBooksFailure({required this.error});
}