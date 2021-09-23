import 'package:flutter/material.dart';
import 'package:movie_app_flutter/provider/movie_details_provider.dart';
import 'package:movie_app_flutter/view/details/widget/details_view.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget{

  Future<void> _loadData(BuildContext context, int id) async {
    await Provider.of<MovieDetailsProvider>(context, listen: false).getMovieDetails(context,  id);
  }

  final int movieId;
  MovieDetailsScreen({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    _loadData(context, movieId);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: MovieView(),
      ),
    );
  }

}