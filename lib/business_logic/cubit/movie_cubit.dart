import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/repository/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit(this.movieRepository) : super(MovieInitialState());

  static MovieCubit get(context) => BlocProvider.of<MovieCubit>(context);

  final MovieRepository movieRepository;
  List<dynamic> myMovies = [];
  Future<List<dynamic>> getAllMovies() async {
    movieRepository.getAllMovies().then(
      (movie) {
        emit(MovieLoadedState(movies: movie));
        myMovies = movie;
        print(myMovies);
      },
    );
    return myMovies;
  }
}
