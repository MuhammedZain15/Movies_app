class MoviesModelList {
  final List<MoviesModel> movies;

  MoviesModelList({required this.movies});

  factory MoviesModelList.fromJson(Map<String, dynamic> json) {
    return MoviesModelList(
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
  final double rating;

  MoviesModel({
    required this.backDropImage,
    required this.movieId,
    required this.movieTitle,
    required this.posterImage,
    required this.releaseDate,
    required this.rating,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      rating: json["vote_average"] ?? 0,
      backDropImage: json['backdrop_path'] ?? "/wvqdJLVh0mSblly7UnYFPEk04Wd.jpg",
      movieId: json['id'] ?? 0,
      movieTitle: json['title'] ?? "",
      posterImage: json['poster_path'] ?? "/yj8LbTju1p7CUJg7US2unSBk33s.jpg",
      releaseDate: json['release_date'] ?? "",
    );
  }
}
