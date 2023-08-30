import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app_newwave/features/popular_list/bloc/movie_bloc.dart';

import '../../../models/movie_model.dart';

class PopularListPage extends StatefulWidget {
  const PopularListPage({Key? key}) : super(key: key);

  @override
  State<PopularListPage> createState() => _PopularListPageState();
}

class _PopularListPageState extends State<PopularListPage> {
  final ScrollController _scrollController = ScrollController();
  int limit = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    context.read<MovieBloc>().add(PopularMovieEvent(1));
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      loadMoreMovie();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular list",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (BuildContext context, state) {
                if (state is MovieLoading) {
                  return GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 9 / 14),
                      itemCount: 20,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.white70,
                          highlightColor: Colors.black54,
                          child: Container(
                            color: Colors.black54,
                          ),
                        );
                      });
                } else if (state is MovieLoaded) {
                  final List<Movie> list = state.popularMovieList;
                  // print("cccc ${list.length}");
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<MovieBloc>().add(const PopularMovieEvent(1));
                    },
                    child: GridView.builder(
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 9 / 14),
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final popularMovie = list[index];
                          return _itemGridView(context, popularMovie);
                        }),
                  );
                } else {
                  return const Center(
                    child: Text('Co loi server'),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemGridView(BuildContext context, Movie popularMovie) {
    double num = popularMovie.voteAverage;
    String integerValue = num.toString().split(".")[0];
    String decimalValue = num.toString().split(".")[1];

    String? releaseDate = popularMovie.releaseDate;
    String? releaseYear = releaseDate?.split("-")[0];
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${popularMovie.posterPath}",
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.orangeAccent, Colors.pink],
                            )),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                integerValue,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Text(
                                ".$decimalValue",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            releaseYear!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            width: 130.w,
                            child: Text(
                              maxLines: 3,
                              (popularMovie.originalTitle ?? "").toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadMoreMovie() {
    limit += 10;
    context.read<MovieBloc>().add(LoadMorePopularMovieEvent(limit: limit));
  }
}
