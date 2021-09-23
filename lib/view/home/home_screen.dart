
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/provider/popular_provider.dart';
import 'package:movie_app_flutter/view/home/widget/popular_movie_view.dart';
import 'package:movie_app_flutter/view/home/widget/title_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{

  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<PopularProvider>(context, listen: false).getCategoryList(context, reload, 1);
  }

  @override
  Widget build(BuildContext context) {
    _loadData(context, false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await _loadData(context, true);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: TitleWidget(title: "Popular Movies", ),
              ),

              Consumer<PopularProvider>(
                builder: (context, category, child) {

                  return category.movieResponse == null ? PopularMovieView() : category.movieResponse.results.length == 0 ? SizedBox() : PopularMovieView();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

}

