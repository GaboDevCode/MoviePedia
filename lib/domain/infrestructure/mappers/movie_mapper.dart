// Clase generada para leer diferentes modelos y crear una entidad
// Objetivo principal: Funcionar como una capa de proteccion para recibir la data de la APi, con nuestra aplicacion

import 'package:movie_pedia/domain/entities/movie.dart';  
import 'package:movie_pedia/domain/infrestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  
  static Movie movieTheMovieDbEntity(MovieMoviedb moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/image-not-found-icon.png',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
    ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
    : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
