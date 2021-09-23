import 'package:flutter/material.dart';
import 'package:movie_app_flutter/data/datasource/dio/dio_client.dart';
import 'package:movie_app_flutter/data/datasource/exception/api_error_handler.dart';
import 'package:movie_app_flutter/data/model/base/api_response.dart';
import 'package:movie_app_flutter/utill/app_constants.dart';

class MovieDetailsRepository{
  final DioClient dioClient;
  MovieDetailsRepository({@required this.dioClient});

  Future<ApiResponse> getMovieDetails(int movieId) async {
    try {
      final response = await dioClient.get(AppConstants.MOVIE_DETAILS_URI+movieId.toString()+AppConstants.DETAILS_API_KEY);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}