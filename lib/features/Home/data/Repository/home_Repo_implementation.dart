import 'package:bookly/core/Web_Service/Web_Services.dart';
import 'package:bookly/core/errors/Failure.dart';
import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/data/Repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class homeRepoImplementation implements home_repository {
  webService webservice;

  homeRepoImplementation({required this.webservice});

  final _endpointForBestSeller =
      'volumes?Filtering=free-ebooks&Sorting=newest &q=computerscience';
  final _endpointForFeaturebook =
      'volumes?Filtering=free-ebooks&q=computerscience';
  final _endPointForSimilarbook =
      'volumes?Filtering=free-ebooks&q=computerscience&Sorting=relevance';
   List<Bookmodel> _Featurebook = [];
   List<Bookmodel> _Similarbook = [];
   List<Bookmodel> _BestSellerbook = [];

  @override
  Future<Either<Failure, List<Bookmodel>>> getBestSellerBooks() async {
    try {
      var data = await webservice.getdata(endPoint: _endpointForBestSeller);
      _BestSellerbook=[];
      for (var item in data['items']) {
        _BestSellerbook.add(Bookmodel.fromJson(item));
      }
      return right(_BestSellerbook);
    } catch (e) {
      if (e is DioError) {
        print('error');
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          errormessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Bookmodel>>> getFeatureBooks() async {
    try {
      var data = await webservice.getdata(endPoint: _endpointForFeaturebook);
      _Featurebook=[];
      for (var item in data['items']) {
        _Featurebook.add(Bookmodel.fromJson(item));
      }
      print(_Featurebook);

      return right(_Featurebook);
    } catch (e) {
      print('error');

      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          errormessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Bookmodel>>> getSimilarBook({required String category}) async {
    try {
      var data = await webservice.getdata(endPoint: _endPointForSimilarbook);
      _Similarbook=[];
      for (var item in data['items']) {
        _Similarbook.add(Bookmodel.fromJson(item));
      }
      print(_Similarbook);

      return right(_Similarbook);
    } catch (e) {
      print('error');

      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          errormessage: e.toString(),
        ),
      );
    }
  }
}

