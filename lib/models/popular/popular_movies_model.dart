class PopularMoviesModel {
  final List<MoviesModel> movies;

  PopularMoviesModel({required this.movies});

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
        movies: (json["results"] as List)
            .map((e) => MoviesModel.fromJson(e))
            .toList());
  }
}

class MoviesModel {
  final String backDropImage;
  final int movieId;
  final String movieTitle;
  final String posterImage;
  final String releaseDate;

  MoviesModel(
      {required this.backDropImage,
      required this.movieId,
      required this.movieTitle,
      required this.posterImage,
      required this.releaseDate});

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      backDropImage: json['backdrop_path'],
      movieId: json['id'],
      movieTitle: json['title'],
      posterImage: json['poster_path'],
      releaseDate: json['release_date'],
    );
  }
}
