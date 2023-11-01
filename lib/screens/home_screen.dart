import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas En Cartelera'),
        actions: [
          IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      body: Column(
         children: [
          CardSwiperScreen(movies: moviesProvider.mostarMovies ),

          MovieSliderScreen(
            movies: moviesProvider.popularMovies,
            title: 'Populares',
            onNextPage: () => moviesProvider.getOnPopularMovies(),
            )
         ],
      ),
    );
  }
}