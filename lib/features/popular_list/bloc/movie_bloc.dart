import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_newwave/request/movie_request.dart';

import '../../../models/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<PopularMovieEvent>(_getPopularMovies);
    on<LoadMorePopularMovieEvent>(_loadMoreMovie);
  }
  Future<void> _getPopularMovies(
      PopularMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    List<Movie> mMovies = await MovieRequest().getPopularMovie(event.page);
    // ignore: unnecessary_null_comparison
    if (mMovies != null) {
      emit(MovieLoaded(popularMovieList: mMovies));
    } else {
      emit(MovieLoadError(err: "Co loi server"));
    }
  }

  Future<void> _loadMoreMovie(
      LoadMorePopularMovieEvent event, Emitter<MovieState> emit) async {
    MovieLoaded loaded = state as MovieLoaded;
    List<Movie> mMovies = await MovieRequest().getPopularMovie(event.limit);
    // ignore: unnecessary_null_comparison
    if (mMovies != null) {
      emit(MovieLoaded(popularMovieList: loaded.popularMovieList + mMovies));
    } else {
      emit(MovieLoadError(err: "Co loi server"));
    }
  }
}
