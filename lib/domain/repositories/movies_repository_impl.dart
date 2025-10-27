import 'package:movie_pedia/domain/datasources/movies_datasources.dart';
import 'package:movie_pedia/domain/entities/movie.dart';
import 'package:movie_pedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasources datasources;

  MoviesRepositoryImpl(this.datasources);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasources.getNowPlaying(page: page);
  }
}
