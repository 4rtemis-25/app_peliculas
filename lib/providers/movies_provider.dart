import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'a21f1fc9ad3ccf99daa1f1fa6193110d';
  final String _language = 'es-ES';
  final String _baseUrl = 'api.themoviedb.org';

  MoviesProvider() {
    print('Movies Provider');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key':_apiKey,
    });

    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData);
  }
}