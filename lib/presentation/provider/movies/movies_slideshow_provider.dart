import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_pedia/domain/entities/movie.dart';
import 'package:movie_pedia/presentation/provider/movies/movies_provider.dart';

// Provider de carrsel de movie slideshow
final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlaying = ref.watch(nowPlayingMoviesProviders);

  if (nowPlaying.isEmpty) return [];

  return nowPlaying.sublist(0, 6);
});
