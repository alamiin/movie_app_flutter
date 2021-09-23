import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/provider/popular_provider.dart';
import 'package:movie_app_flutter/utill/color_resources.dart';
import 'package:movie_app_flutter/utill/dimensions.dart';
import 'package:movie_app_flutter/utill/styles.dart';
import 'package:movie_app_flutter/view/details/details_screen.dart';
import 'package:provider/provider.dart';
import 'package:movie_app_flutter/utill/images.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovieView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Consumer<PopularProvider>(
     builder: (context, category, child){
       return Expanded(child: Container(
         height: MediaQuery.of(context).size.height,
         child: SizedBox(
           width: MediaQuery.of(context).size.width - 10,
           child: category.movieResponse != null ? category.movieResponse.results.length > 0 ? ListView.builder(
             itemCount: category.movieResponse.results.length,
             padding: EdgeInsets.only(left: 10),
             physics: BouncingScrollPhysics(),
             scrollDirection: Axis.vertical,
             itemBuilder: (context, index) {
               return Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(5.0),
                 ),
                 child: InkWell(
                   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetailsScreen(movieId: category.movieResponse.results[index].id))),
                   borderRadius: BorderRadius.circular(5),
                   child: Padding(
                     padding: EdgeInsets.only(right: 10, left: 10, top: 5,bottom: 5),
                     child: Row(
                       children: [

                         FadeInImage.assetNetwork(
                           placeholder: Images.placeholder_image,
                           image: 'https://image.tmdb.org/t/p/w342/${category.movieResponse.results[index].posterPath}',
                           width: 125, height: 85, fit: BoxFit.cover,
                         ),

                         SizedBox(width: 10,),

                         Expanded(child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text(
                                 category.movieResponse.results[index].title,
                                 style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                               ),
                               SizedBox(height: 5,),
                               Container(
                                 child:  Text(
                                   category.movieResponse.results[index].overview,
                                   style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                   maxLines: 3,
                                   overflow: TextOverflow.clip,
                                 ),
                               ),
                               SizedBox(height: 5,),
                               Text(
                                 category.movieResponse.results[index].releaseDate,
                                 style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                               ),

                             ]))

                       ],
                     ),
                   ),
                 ),
               );
             },
           ) : Center(child: Text("Movie Not Found")) : CategoryShimmer(),
         ),
       ));
     }
   );
  }

}

class CategoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: Provider.of<PopularProvider>(context).movieResponse == null,
                child: Row(
                  children: [

                    Container(
                      height: 85, width: 125,
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        shape: BoxShape.rectangle,
                      ),
                    ),

                    SizedBox(width: 10,),

                    Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(height: 10, width: MediaQuery.of(context).size.width, color: ColorResources.COLOR_WHITE),
                          SizedBox(height: 5,),
                          Container(height: 10, width: MediaQuery.of(context).size.width, color: ColorResources.COLOR_WHITE),
                          SizedBox(height: 5,),
                          Container(height: 10, width: MediaQuery.of(context).size.width, color: ColorResources.COLOR_WHITE),

                        ])),
                    SizedBox(width: 10,),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}