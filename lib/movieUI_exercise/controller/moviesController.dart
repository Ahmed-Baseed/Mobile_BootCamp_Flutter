import 'package:mobile_bootcamp_flutter/movieUI_exercise/model/movieDetails.dart';

class MoviesController {
  List<MovieDetails> _allMovie = [];
  List<Map<String, dynamic>> data = [
    {
      "name": "Breaking Bad",
      "category": "Sci-Fi",
      "rating": 9.9,
      "imagePath": "assets/images/movie/trend/1.jpg",
      "type": "Movie"
    },
    {
      "name": "One Piece",
      "category": "Drama",
      "rating": 9.3,
      "imagePath": "assets/images/movie/trend/2.jpg",
      "type": "Anime"
    },
    {
      "name": "Cukur",
      "category": "Crime",
      "rating": 8.9,
      "imagePath": "assets/images/movie/trend/3.jpg",
      "type": "Series"
    },
    {
      "name": "The Equlaizer",
      "category": "Crime",
      "rating": 9.2,
      "imagePath": "assets/images/movie/trend/4.jpg",
      "type": "Kids Content"
    },
    {
      "name": "Karalus Osman",
      "category": "Drama",
      "rating": 8.8,
      "imagePath": "assets/images/movie/trend/5.jpg",
      "type": "TV Show"
    },
    {
      "name": "Inception",
      "category": "Sci-Fi",
      "rating": 7.8,
      "imagePath": "assets/images/movie/trend/6.jpg",
      "type": "Movie"
    },
    {
      "name": "The Godfather",
      "category": "Drama",
      "rating": 9.8,
      "imagePath": "assets/images/movie/trend/7.jpg",
      "type": "Movie"
    },
    {
      "name": "GoT",
      "category": "Historic",
      "rating": 9.8,
      "imagePath": "assets/images/movie/trend/8.jpg",
      "type": "Series"
    },
    {
      "name": "Squid Game",
      "category": "Drama",
      "rating": 9.8,
      "imagePath": "assets/images/movie/trend/9.jpg",
      "type": "Series"
    },
    {
      "name": "Demon Slayer",
      "category": "Action",
      "rating": 9.8,
      "imagePath": "assets/images/movie/trend/10.jpg",
      "type": "Anime"
    },
  ];
  getAllmovie() {
    data.forEach((element) {
      MovieDetails movieDetails = MovieDetails.fromJson(element);
      _allMovie.add(movieDetails);
    });
  }

  List<MovieDetails> get movies => _allMovie;
}
