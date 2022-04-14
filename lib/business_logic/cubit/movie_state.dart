part of 'movie_cubit.dart';

@immutable
abstract class MovieStates {}

class MovieInitialState extends MovieStates {}

class MovieLoadedState extends MovieStates {
  final List<dynamic> movies;

  MovieLoadedState({required this.movies});
}
