import 'dart:convert';

import 'package:movies_app/models/genres_model.dart';
import 'package:movies_app/models/search_model.dart';
import 'package:movies_app/services/config/constants.dart';
import 'package:http/http.dart' as http;
import '../../models/details_model/details.dart';
import '../../models/popular/popular_movies_model.dart';

class ApiManager {
  static Future<List<MoviesModel>> fetchPopularMovies() async {
    var url = Uri.https(Constants.domain, "/3/movie/popular", {
      "language": "en-US",
      "page": "1",
    });
    final response = await http.get(
      url,
      headers: {
        "Authorization": Constants.apiToken,
        "accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var movies = MoviesModelList.fromJson(data);
      return movies.movies;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  static Future<List<MoviesModel>> fetchUpcomingMovies() async {
    var url = Uri.https(Constants.domain, "/3/movie/upcoming", {
      "language": "en-US",
      "page": "1",
    });
    final response = await http.get(
      url,
      headers: {
        "Authorization": Constants.apiToken,
        "accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var movies = MoviesModelList.fromJson(data);
      return movies.movies;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  static Future<List<MoviesModel>> fetchRecommendedMovies() async {
    var url = Uri.https(
      Constants.domain,
      "/3/movie/top_rated",
      {
        "language": "en-US",
        "page": "1",
      },
    );
    final response = await http.get(url, headers: {
      "Authorization": Constants.apiToken,
      "accept": "application/json",
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var movies = MoviesModelList.fromJson(data);
      return movies.movies;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  static Future<Movies> fetchSearch(String queryParameters) async {
    Uri url = Uri.https(
      'api.themoviedb.org',
      '/3/search/movie',
      {
        'api_key': Constants.apiKey,
        'query': queryParameters,
      },
    );
    final response = await http.get(url);
    var searchResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return searchResponse;
    } else {
      throw Exception('Failed to load Data');
    }
  }


  static Future<GenresModel> FetchGenres() async {
    Uri url = Uri.https(Constants.domain, "/3/genre/movie/list", {
      'api_key': Constants.apiKey,
      "language": "en-U",
    });
    final response = await http.get(url);
    var genresResponse = GenresModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return genresResponse;
    } else {
      throw Exception('Failed to load Data');
    }
  }
  static Future<Movies> fetchMoviesList(String catId) async {
Uri url = Uri.https(Constants.domain, '/3/discover/movie', {
      'api_key': Constants.apiKey,
      'with_genres': catId,
    });
    final response = await http.get(url);
    var listResponse = Movies.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return listResponse;
    } else {
      throw Exception('Faild to load album');
    }
  }
  static Future<DetailsModel> fetchDetails(int id) async {
    var url = Uri.https(Constants.domain, "/3/movie/$id", {
      "language": "en-US",
      "page": "1",
    });
    final response = await http.get(
      url,
      headers: {
        "Authorization": Constants.apiToken,
        "accept": "application/json",
      },
    );
    if(response.statusCode==200){
      var data = jsonDecode(response.body);

      var movie = DetailsModel.fromJson(data);
      return movie;
    }
    else {
      throw Exception('Failed to load Details');
    }
  }

  static Future<List<MoviesModel>> fetchSimilarMovies(int id)async{
    var url =Uri.https(Constants.domain,"/3/movie/$id/similar",{
      "language": "en-US",
      "page": "1",
    });
    final response = await http.get(url,headers: {
      "Authorization": Constants.apiToken,
      "accept": "application/json",
    });
    if ( response.statusCode==200){
      var data =jsonDecode(response.body);

      var movie =MoviesModelList.fromJson(data);
      return movie.movies;
    }else{
      throw Exception('Failed to load Similar Movies');
    }
  }

}




