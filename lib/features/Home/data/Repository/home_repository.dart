import 'package:bookly/core/errors/Failure.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class home_repository {
  Future<Either<Failure, List<Bookmodel>>> getBestSellerBooks();

  Future<Either<Failure, List<Bookmodel>>> getFeatureBooks();

  Future<Either<Failure, List<Bookmodel>>> getSimilarBook({required String category});
}
