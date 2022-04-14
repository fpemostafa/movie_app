import 'package:movie_app/data/web_services/dio_helper.dart';

class MovieRepository {
  final MovieWebServices movieWebServices;
  MovieRepository(this.movieWebServices);

  Future<List<dynamic>> getAllMovies() async {
    final movie = await movieWebServices.fitchMovieData();
    return movie;
  }
}
