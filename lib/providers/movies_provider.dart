import 'dart:convert';

import 'package:app_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'a21f1fc9ad3ccf99daa1f1fa6193110d';
  final String _language = 'es-ES';
  final String _baseUrl = 'api.themoviedb.org';

  List<Movie> mostarMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    print('Movies Provider');

    getOnDisplayMovies();
    getOnPopularMovies();
  }

  Future<String> _getJsonMovies(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key':_apiKey,
      'language':_language,
      'page':'$page'
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonMovies('3/movie/now_playing');
    final nowPlaying = NewPlayingResponse.fromRawJson(jsonData);
    mostarMovies = nowPlaying.results;
    notifyListeners();
  }

  getOnPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonMovies('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromRawJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}