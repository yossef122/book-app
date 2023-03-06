import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Failure {
  final String errormessage;

  Failure({required this.errormessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errormessage});

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(errormessage: ' Connection Timeout With api');

      case DioErrorType.receiveTimeout:
        return ServerFailure(errormessage: ' Receive Timeout With api');

      case DioErrorType.badCertificate:
        return ServerFailure(errormessage: ' bad Certificate With api');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode,dioError.response!.data );

      case DioErrorType.cancel:
        return ServerFailure(errormessage: 'Connection With api Canceled');

      case DioErrorType.connectionError:
        return ServerFailure(errormessage: 'Connection With api has an un know error');

      case DioErrorType.unknown:
        if(dioError.message?.contains('Socketexception')??false){
          return ServerFailure(errormessage: 'no internet Connection ,please check it');
        }
      else{
          return ServerFailure(errormessage: 'Connection With api has an un know error ,try later');
        }
      case DioErrorType.sendTimeout:
        return ServerFailure(errormessage: ' Send Timeout With api');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if(statusCode ==400 ||statusCode ==401 ||statusCode ==403 ){
      return ServerFailure(errormessage: response['error']['message']);
    }else if(statusCode ==404){
      return ServerFailure(errormessage:'request Not found ,Try again');

    }else if(statusCode ==500){
      return ServerFailure(errormessage:'Internal server error ,Try later');

    }else{
      return ServerFailure(errormessage:'Opps there is a problem ,try again');

    }

  }
}
