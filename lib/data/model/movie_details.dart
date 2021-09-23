class MovieDetails {
  bool _adult;
  String _backdropPath;
  int _budget;
  String _homepage;
  int _id;
  String _imdbId;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  double _popularity;
  String _posterPath;
  String _releaseDate;
  int _revenue;
  int _runtime;
  String _status;
  String _tagline;
  String _title;
  bool _video;
  double _voteAverage;
  int _voteCount;

  bool get adult => _adult;
  String get backdropPath => _backdropPath;
  int get budget => _budget;
  String get homepage => _homepage;
  int get id => _id;
  String get imdbId => _imdbId;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  String get overview => _overview;
  double get popularity => _popularity;
  String get posterPath => _posterPath;
  String get releaseDate => _releaseDate;
  int get revenue => _revenue;
  int get runtime => _runtime;
  String get status => _status;
  String get tagline => _tagline;
  String get title => _title;
  bool get video => _video;
  double get voteAverage => _voteAverage;
  int get voteCount => _voteCount;

  MovieDetails({
      bool adult, 
      String backdropPath, 
      int budget, 
      String homepage, 
      int id, 
      String imdbId, 
      String originalLanguage, 
      String originalTitle, 
      String overview, 
      double popularity, 
      String posterPath, 
      String releaseDate, 
      int revenue, 
      int runtime, 
      String status, 
      String tagline, 
      String title, 
      bool video, 
      double voteAverage, 
      int voteCount}){
    _adult = adult;
    _backdropPath = backdropPath;
    _budget = budget;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _revenue = revenue;
    _runtime = runtime;
    _status = status;
    _tagline = tagline;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  MovieDetails.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _budget = json['budget'];
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['budget'] = _budget;
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['imdb_id'] = _imdbId;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['release_date'] = _releaseDate;
    map['revenue'] = _revenue;
    map['runtime'] = _runtime;
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}