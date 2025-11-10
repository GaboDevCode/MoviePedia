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

  @override
  Future<List<Movie>> getPopularMovie({int page = 1}) {
    return datasources.getPopularMovie(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRatedMovie({int page = 1}) {
        return datasources.getTopRatedMovie(page: page);
  }
  

  // optener pelicula por Id
  @override
  Future<Movie> getDetailMovie(String id) {
    return datasources.getDetailMovie(id);
  }
}
