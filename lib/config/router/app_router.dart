

import 'package:go_router/go_router.dart';
import 'package:movie_pedia/screens/movies/home_screen.dart';

final GoRouter  appRouter= GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen()
      
    ),
  ],
);

