import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;
import 'provider/movie_details_provider.dart';
import 'provider/popular_provider.dart';
import 'view/home/home_screen.dart';
Future<void> main() async {
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<PopularProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<MovieDetailsProvider>()),
    ],
    child: MyApp(),
  )
  );
}

//testing testing my code

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
