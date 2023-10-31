import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'a21f1fc9ad3ccf99daa1f1fa6193110d';
  final String _baseUrl = 'https://api.themoviedb.org';

  MoviesProvider() {
    print('Movies Provider');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('getOndisplayMovies');

    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
    });

    final response = await http.get(url);
    print(response.body);
  }
}