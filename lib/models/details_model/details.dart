class DetailsModel {
  final String backDropImage;
  final int movieId;
  final String movieTitle;
  final String posterImage;
  final String releaseDate;
  final String status;
  final String overview;
  final double rating;
  final List<GenreIds> genreIds;

  DetailsModel({
    required this.overview,
    required this.status,
    required this.genreIds,
    required this.backDropImage,
    required this.movieId,
    required this.movieTitle,
    required this.posterImage,
    required this.releaseDate,
    required this.rating,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      status: json["status"],
      genreIds:
          (json["genres"] as List).map((e) => GenreIds.fromJson(e)).toList(),
      rating: json["vote_average"],
      backDropImage: json['backdrop_path'],
      movieId: json['id'],
      movieTitle: json['title'],
      posterImage: json['poster_path'],
      releaseDate: json['release_date'],
      overview: json["overview"],
    );
  }
}

class GenreIds {
  final int genreIds;
  final String name;

  GenreIds({
    required this.name,
    required this.genreIds,
  });

  factory GenreIds.fromJson(Map<String, dynamic> json) {
    return GenreIds(
      genreIds: json["id"],
      name: json["name"],
    );
  }
}
