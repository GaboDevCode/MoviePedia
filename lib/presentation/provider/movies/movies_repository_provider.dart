import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_pedia/domain/repositories/movies_repository_impl.dart';
import 'package:movie_pedia/domain/infrestructure/datasources/themovies_datasource.dart';


// repositorio inmutable
class MoviesRepositoryProvider {  

  final movieRepositoryProvider = Provider((ref) {
      final datasource = ThemoviesDatasource();
      return MoviesRepositoryImpl(datasource);
  });

}