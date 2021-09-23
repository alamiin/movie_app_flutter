import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/data/repository/movie_details_repository.dart';
import 'package:movie_app_flutter/provider/popular_provider.dart';
import 'package:movie_app_flutter/utill/app_constants.dart';
import 'data/datasource/dio/dio_client.dart';
import 'data/datasource/dio/logging_interceptor.dart';
import 'data/repository/popular_repository.dart';
import 'provider/movie_details_provider.dart';



final sl = GetIt.instance;

Future<void> init() async {

  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl()));

  // Repository
  sl.registerLazySingleton(() => PopularRepository(dioClient: sl()));
  sl.registerLazySingleton(() => MovieDetailsRepository(dioClient: sl()));

  // Provider
  sl.registerFactory(() => PopularProvider(popularRepository: sl()));
  sl.registerFactory(() => MovieDetailsProvider(movieDetailsRepository: sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

}
