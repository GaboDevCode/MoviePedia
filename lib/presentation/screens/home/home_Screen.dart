import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_pedia/presentation/provider/movies/movies_provider.dart';
import 'package:movie_pedia/presentation/provider/movies/read_providers_status.dart';
import 'package:movie_pedia/presentation/provider/providers.dart';

import 'package:movie_pedia/presentation/widgtes/widgets.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
    ref.read(getPopularMovie.notifier).loadNextPage();
    ref.read(getTopRatedMovieProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialProviders);

    if (initialLoading) return FullScreenLoader();

    final nowPlaying = ref.watch(nowPlayingMoviesProviders);
    final moviesSlideShow = ref.watch(moviesSlideShowProvider);
    final getPopularMovieProvider = ref.watch(getPopularMovie);
    final getTopRatedMovie = ref.watch(getTopRatedMovieProvider);

    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: CustomAppbar(),
            centerTitle: false,
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  //     CustomAppbar(),
                  MoviesSlideshow(movies: moviesSlideShow),

                  MoviesHorizontalListview(
                    movies: nowPlaying,
                    title: "Peliculas",
                    subTitle: "Lunes 20",
                    loadNextPage: () {
                      ref
                          .read(nowPlayingMoviesProviders.notifier)
                          .loadNextPage();
                    },
                  ),
                  MoviesHorizontalListview(
                    movies: getPopularMovieProvider,
                    title: "Mas populares",
                    subTitle: "Este mes",
                    loadNextPage: () =>
                        ref.read(getPopularMovie.notifier).loadNextPage(),
                  ),
                  MoviesHorizontalListview(
                    movies: getTopRatedMovie,
                    title: "Proximamente",
                    subTitle: "Lo mas popular",
                    loadNextPage: () {
                      ref
                          .read(getTopRatedMovieProvider.notifier)
                          .loadNextPage();
                    },
                  ),
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
