import 'package:flutter_riverpod/legacy.dart';
import 'package:movie_pedia/domain/entities/movie.dart';
import 'package:movie_pedia/presentation/provider/movies/movies_repository_provider.dart';

//Provider para notificar el estado de las peliculas actuales en The Movie DB

typedef MovieCallBack = Future<List<Movie>> Function({int page});

final nowPlayingMoviesProviders =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final moviesRepository = ref.watch(movieRepositoryProvider);
      final fetchMoreMovies = moviesRepository.getNowPlaying;
      
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await  fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
