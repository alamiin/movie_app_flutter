
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/provider/movie_details_provider.dart';
import 'package:movie_app_flutter/utill/dimensions.dart';
import 'package:movie_app_flutter/utill/images.dart';
import 'package:movie_app_flutter/utill/styles.dart';
import 'package:provider/provider.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailsProvider>(
        builder: (context, response, child){
          return response.movieDetails != null ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                  placeholder: Images.placeholder_image,
                  image: 'https://image.tmdb.org/t/p/w342/${response.movieDetails.posterPath}',
                  width: MediaQuery.of(context).size.width, fit: BoxFit.fill,
                ),

                Row(
                  children: [
                    SizedBox(width: 10,),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              response.movieDetails.title,
                              style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              response.movieDetails.tagline,
                              style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Movie Details",
                              style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "Release Date: ",
                                  style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  response.movieDetails.releaseDate,
                                  style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "Rating: ",
                                  style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  response.movieDetails.voteAverage.toString(),
                                  style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "Runtime: ",
                                  style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  response.movieDetails.runtime.toString()+" minutes",
                                  style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),

                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "Budget: ",
                                  style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  response.movieDetails.budget.toString(),
                                  style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),

                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "Revenue: ",
                                  style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  response.movieDetails.revenue.toString(),
                                  style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),

                            SizedBox(height: 5,),
                            Text(
                              "Overview",
                              style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text(
                                response.movieDetails.overview,
                                style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            SizedBox(height: 20,),

                          ],
                        )
                    ),
                    SizedBox(width: 10,),
                  ],
                )
              ],
            ),
          ) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
        }
    );
  }

}