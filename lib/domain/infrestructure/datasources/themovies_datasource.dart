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



  List<Movie> _toJsonMovie(Map<String, dynamic> json) {
    final movieDbResponse = TheMovieDb.fromJson(json); // recibimos el Json

    // Mapeamos

    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieTheMovieDbEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    return _toJsonMovie(response.data);
  }

  // Obtener peliculas mas populares
  @override
  Future<List<Movie>> getPopularMovie({int page = 1}) async {

     final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _toJsonMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRatedMovie({int page = 1}) async {
       final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );

    return _toJsonMovie(response.data);
  }
}
