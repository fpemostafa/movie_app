import 'package:flutter/material.dart';
import 'package:movie_app/business_logic/cubit/movie_cubit.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/web_services/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/screens/home/home_page.dart';

class AppRouter {
  final MovieRepository movieRepository =
      MovieRepository(MovieWebServices());

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MovieCubit(movieRepository),
            child: const HomePage(),
          ),
        );
    }
    return null;
  }
}
