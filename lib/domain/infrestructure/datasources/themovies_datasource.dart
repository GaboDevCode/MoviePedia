import 'package:dio/dio.dart';
import 'package:movie_pedia/config/constants/environment.dart';
import 'package:movie_pedia/domain/datasources/movies_datasources.dart';
import 'package:movie_pedia/domain/entities/movie.dart';
import 'package:movie_pedia/domain/infrestructure/mappers/movie_mapper.dart';
import 'package:movie_pedia/domain/infrestructure/models/moviedb/moviedb_response.dart';

/// Clase creada para interacturar con la clase Movie Datasource

class ThemoviesDatasource extends MoviesDatasources {
  final dio = Dio(
    BaseOptions(
      baseUrl: ('https://api.themoviedb.org/3'),
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    final movieDbResponse = TheMovieDb.fromJson(
      response.data,
    ); // recibimos el Json

    // Mapeamos

    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieTheMovieDbEntity(moviedb))
        .toList();

    return movies;
  }
}
