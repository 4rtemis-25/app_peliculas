import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas En Cartelera'),
        elevation: 0,
        actions: [
          IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      body: const Column(
         children: [
          CardSwiperScreen()
         ],
      ),
    );
  }
}