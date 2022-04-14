import 'package:flutter/material.dart';
import 'package:movie_app/app_router.dart';

import 'app_theme.dart';

void main() {
  runApp(MovieApp(
    appRouter: AppRouter(),
  ));

//   var x = MovieWebServices();
//   var xx = MovieRepository(x);
//  var xxx =  MovieCubit(xx).getAllMovies();
}

class MovieApp extends StatelessWidget {
  final AppRouter appRouter;
  const MovieApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
