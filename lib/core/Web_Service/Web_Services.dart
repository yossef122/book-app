import 'package:dio/dio.dart';

class webService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  Dio dio;

  webService({required this.dio}) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,

    );
    dio=Dio(baseOptions);
  }

  Future<Map<String, dynamic>> getdata({required String endPoint}) async {
    var response = await dio.get(endPoint);
    return response.data;
  }
/*  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  webService({required this.dio});

  Future<Map<String, dynamic>> getdata({required String endPoint}) async {
    print('sssssssss');
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }*/
}
