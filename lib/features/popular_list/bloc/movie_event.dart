part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class PopularMovieEvent extends MovieEvent {
  final int page;
  const PopularMovieEvent(this.page);
  @override
  List<Object?> get props => [page];
}

class LoadMorePopularMovieEvent extends MovieEvent {
  final int limit;
  const LoadMorePopularMovieEvent({required this.limit});

  @override
  List<Object?> get props => [limit];
}
