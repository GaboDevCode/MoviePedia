import 'package:flutter_riverpod/legacy.dart';
import 'package:movie_pedia/domain/entities/movie.dart';
import 'package:movie_pedia/presentation/provider/movies/movies_repository_provider.dart';

final getMovieDetailsProvider = StateNotifierProvider((ref) {
  final getMovie = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: getMovie.getDetailMovie);
});

// ignore: camel_case_types
typedef getMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier {
  final getMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movie};
  }
}
