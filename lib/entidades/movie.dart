class Movie {
  String id;
  String title;
  String director;
  int year;
  String? poster;
  List<String>? photos;

  Movie({required this.id, required this.title, required this.director, required this.year, this.poster, this.photos});
}