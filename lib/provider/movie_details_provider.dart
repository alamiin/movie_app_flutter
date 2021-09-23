import 'package:flutter/material.dart';
import 'package:movie_app_flutter/data/model/base/api_response.dart';
import 'package:movie_app_flutter/data/model/movie_details.dart';
import 'package:movie_app_flutter/data/repository/movie_details_repository.dart';

class MovieDetailsProvider extends ChangeNotifier{
  MovieDetailsRepository movieDetailsRepository;

  MovieDetailsProvider({@required this.movieDetailsRepository});

  MovieDetails movieDetails;

  Future<void> getMovieDetails(BuildContext context, int movieId) async {
    movieDetails = null;
    if(movieDetails == null ) {
      ApiResponse apiResponse = await movieDetailsRepository.getMovieDetails(movieId);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        movieDetails = MovieDetails.fromJson(apiResponse.response.data);
      } else {
        print("Request Failed");
      }
      notifyListeners();
    }
  }
}