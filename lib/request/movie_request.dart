import 'package:dio/dio.dart';

import '../models/movie_model.dart';

class MovieRequest {
  final Dio dio = Dio();
  final String baseUrl = "https://api.themoviedb.org/3";
  final String apiKey = "26763d7bf2e94098192e629eb975dab0";

  Future<List<Movie>> getPopularMovie(int page) async {
    try {
      final response =
          await dio.get('$baseUrl/discover/movie', queryParameters: {
        'api_key': apiKey,
        'page': page,
      });
      if (response.statusCode == 200) {
        List<Movie> list = [];
        List<dynamic> jsonResponse = response.data["results"];
        for (int i = 0; i < jsonResponse.length; i++) {
          list.add(Movie.fromJson(jsonResponse[i]));
        }
        return list;
      } else {
        return [];
      }
    } on DioException catch (e) {
      return e.response?.data;
    } catch (error) {
      return [];
    }
  }
}
