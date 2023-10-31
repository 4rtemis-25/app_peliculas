import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Movies Provider');
  }

  getOnDisplayMovies() async {
    print('getOndisplayMovies');
  }
}