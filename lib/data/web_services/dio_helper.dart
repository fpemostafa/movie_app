import 'dart:convert';

import 'package:dio/dio.dart';

class MovieWebServices {
  final baseUrl = 'https://imdb-api.com/en/API/MostPopularMovies/';
  final apiKey = 'k_wuq6ox8s';
  Dio? dio;
  MovieWebServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
    // initializeInterceptors();
  }

  Future<List<dynamic>> fitchMovieData() async {
    try {
      Response response = await dio!.get(apiKey);

      List movieData = response.data['items'];
      return movieData;
    } on DioError catch (e) {
      print(e.message);
      return [];
    }
  }

  // initializeInterceptors() {
  //   dio!.interceptors.add(
  //     InterceptorsWrapper(
  //       onError: (error, _) {
  //         print(error.message);
  //       },
  //       onRequest: (request, _) {
  //         print('${request.method}: ${request.uri}');
  //       },
  //       onResponse: (response, _) {
  //         print(response.headers);
  //       },
  //     ),
  //   );
  // }
}
