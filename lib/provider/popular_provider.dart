import 'package:flutter/material.dart';
import 'package:movie_app_flutter/data/model/base/api_response.dart';
import 'package:movie_app_flutter/data/model/movie_response.dart';
import 'package:movie_app_flutter/data/repository/popular_repository.dart';

class PopularProvider extends ChangeNotifier{
  PopularRepository popularRepository;

  PopularProvider({@required this.popularRepository});

  MovieResponse movieResponse;

  Future<void> getCategoryList(BuildContext context, bool reload, int pageNo) async {
    if(movieResponse == null || reload) {
      ApiResponse apiResponse = await popularRepository.getPopularMovies(pageNo);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
         movieResponse = MovieResponse.fromJson(apiResponse.response.data);
      } else {
        print("Request Failed");
      }
      notifyListeners();
    }
  }
}