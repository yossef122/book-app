import 'package:bookly/core/Web_Service/Web_Services.dart';
import 'package:bookly/features/Home/data/Repository/home_Repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<webService>(
    webService(
       dio: Dio(),
    ),
  );

  getIt.registerSingleton<homeRepoImplementation>(
    homeRepoImplementation(
      webservice: getIt.get<webService>(),
    ),
  );
}
