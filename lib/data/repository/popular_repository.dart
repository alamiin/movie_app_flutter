import 'package:flutter/material.dart';
import 'package:movie_app_flutter/data/datasource/dio/dio_client.dart';
import 'package:movie_app_flutter/data/datasource/exception/api_error_handler.dart';
import 'package:movie_app_flutter/data/model/base/api_response.dart';
import 'package:movie_app_flutter/utill/app_constants.dart';

class PopularRepository{
  final DioClient dioClient;
  PopularRepository({@required this.dioClient});

  Future<ApiResponse> getPopularMovies(int pageNo) async {
    try {
      final response = await dioClient.get(AppConstants.POPULAR_MOVIE_URI+pageNo.toString());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}