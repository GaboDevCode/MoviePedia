

import 'package:go_router/go_router.dart';
import 'package:movie_pedia/presentation/screens/home/home_Screen.dart';

final GoRouter  appRouter= GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen()
      
    ),
  ],
);

