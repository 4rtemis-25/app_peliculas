import 'dart:async';

import 'package:app_peliculas/helpers/debouncer.dart';
import 'package:app_peliculas/models/models.dart';
import 'package:app_peliculas/models/search_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'a21f1fc9ad3ccf99daa1f1fa6193110d';
  final String _language = 'es-ES';
  final String _baseUrl = 'api.themoviedb.org';

  List<Movie> mostarMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(duration: Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamController =
      new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getOnPopularMovies();
  }

  //METODO PRINCIPAL
  Future<String> _getJsonMovies(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);
    return response.body;
  }

  //TRAER MOVIES ONPLAYING  
  getOnDisplayMovies() async {
    final jsonData = await _getJsonMovies('3/movie/now_playing');
    final nowPlaying = NewPlayingResponse.fromRawJson(jsonData);
    mostarMovies = nowPlaying.results;
    notifyListeners();
  }

  //TRAER MOVIES POPULARES
  getOnPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonMovies('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromRawJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonMovies('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromRawJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromRawJson(response.body);

    return searchResponse.results;
  }

  void getSuggestionsByQuery( String searchTerm ) {
    debouncer.value = '';
    debouncer.onValue = ( value ) async {
      final results = await searchMovies(value);
      _suggestionStreamController.add( results );
    };

    final timer = Timer.periodic(
      Duration(milliseconds: 300), ( _ ) { 
        debouncer.value = searchTerm;
      });

      Future.delayed(Duration(milliseconds: 301)).then(( _ ) => timer.cancel());

  }
}
