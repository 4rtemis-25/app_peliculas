import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 149, 10, 0);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //COLOR PRIMARY
    primaryColor: const Color.fromARGB(255, 149, 10, 0),

    //APPBAR THEME
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 149, 10, 0),
      elevation: 0,
      centerTitle: true
    ),

    //SCAFFOLD THEME
    scaffoldBackgroundColor: Colors.black
  );
}