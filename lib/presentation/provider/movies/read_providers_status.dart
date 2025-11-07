import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_pedia/presentation/provider/movies/movies_provider.dart';
import 'package:movie_pedia/presentation/provider/movies/movies_slideshow_provider.dart';

final initialProviders = Provider<bool>((ref) {
  final nowPlaying = ref.watch(nowPlayingMoviesProviders).isEmpty;
  final moviesSlideShow = ref.watch(moviesSlideShowProvider).isEmpty;
  final getPopularMovieProvider = ref.watch(getPopularMovie).isEmpty;
  final getTopRatedMovie = ref.watch(getTopRatedMovieProvider).isEmpty;

  if (nowPlaying ||
      moviesSlideShow ||
      getTopRatedMovie ||
      getPopularMovieProvider)
    return true;

  return false;
});
