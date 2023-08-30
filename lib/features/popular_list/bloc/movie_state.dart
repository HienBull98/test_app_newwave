part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoaded extends MovieState {
  final List<Movie> popularMovieList;
  MovieLoaded({required this.popularMovieList});
  @override
  List<Object?> get props => [popularMovieList];
}

class MovieLoadError extends MovieState {
  final String err;

  MovieLoadError({required this.err});
  @override
  List<Object?> get props => [err];
}
