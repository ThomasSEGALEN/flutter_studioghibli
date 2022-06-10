class Film {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String image;
  final String movieBanner;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String runningTime;
  final String score;

  const Film(
    this.id,
    this.title,
    this.originalTitle,
    this.originalTitleRomanised,
    this.image,
    this.movieBanner,
    this.description,
    this.director,
    this.producer,
    this.releaseDate,
    this.runningTime,
    this.score,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'original_title_romanised': originalTitleRomanised,
      'image': image,
      'movie_banner': movieBanner,
      'description': description,
      'director': director,
      'producer': producer,
      'release_date': releaseDate,
      'running_time': runningTime,
      'rt_score': score,
    };
  }

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      json['id'],
      json['title'],
      json['original_title'],
      json['original_title_romanised'],
      json['image'],
      json['movie_banner'],
      json['description'],
      json['director'],
      json['producer'],
      json['release_date'],
      json['running_time'],
      json['rt_score'],
    );
  }
}
