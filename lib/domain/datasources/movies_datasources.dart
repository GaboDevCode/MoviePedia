

import 'package:movie_pedia/domain/entities/movie.dart';

abstract class MoviesDatasources {

  Future <List<Movie>> getNowPlaying ({int page = 1});

  Future <List<Movie>> getPopularMovie ({int page =1});
  
  Future <List<Movie>> getTopRatedMovie ({int page =1});

  Future <Movie> getDetailMovie (String id);

}