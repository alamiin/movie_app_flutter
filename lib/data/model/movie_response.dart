import 'movies.dart';

class MovieResponse {
  int _page;
  List<Movies> _movies;
  int _totalPages;
  int _totalResults;

  int get page => _page;
  List<Movies> get results => _movies;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;

  MovieResponse({
      int page, 
      List<Movies> movies, 
      int totalPages, 
      int totalResults}){
    _page = page;
    _movies = movies;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  MovieResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _movies = [];
      json['results'].forEach((v) {
        _movies.add(Movies.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['page'] = _page;
    if (_movies != null) {
      map['results'] = _movies.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}