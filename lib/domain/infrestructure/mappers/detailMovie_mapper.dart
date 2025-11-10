import 'package:movie_pedia/domain/entities/movie.dart';
import 'package:movie_pedia/domain/infrestructure/models/moviedb/getDetailMovie.dart';

class DetailmovieMapper {
  static Movie detailMovie(GetDetailMovie detailMovie) => Movie(
    adult: detailMovie.adult,
    backdropPath: (detailMovie.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${detailMovie.backdropPath}'
        : 'https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/image-not-found-icon.png',
    genreIds: detailMovie.genres.map((e) => e.name).toList(),
    id: detailMovie.id,
    originalLanguage: detailMovie.originalLanguage,
    originalTitle: detailMovie.originalTitle,
    overview: detailMovie.overview,
    popularity: detailMovie.popularity,
    posterPath: (detailMovie.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${detailMovie.backdropPath}'
        : 'https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/image-not-found-icon.png',
    releaseDate: detailMovie.releaseDate,
    title: detailMovie.title,
    video: detailMovie.video,
    voteAverage: detailMovie.voteAverage,
    voteCount: detailMovie.voteCount,
  );
}
