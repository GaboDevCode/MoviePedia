import 'package:dio/dio.dart';
import 'package:movie_pedia/config/constants/environment.dart';
import 'package:movie_pedia/domain/datasources/movies_datasources.dart';
import 'package:movie_pedia/domain/entities/movie.dart';

/// Clase creada para interacturar con la clase Movie Datasource

class ThemoviesDatasource extends MoviesDatasources {
  final dio = Dio(
    BaseOptions(
      baseUrl: ('https://api.themoviedb.org/3'),
      queryParameters: {
        'api-key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final List<Movie> movies = [];

    return movies;
  }
}
