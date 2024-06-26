import 'package:app_peliculas/models/models.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiperScreen extends StatelessWidget {

  final List<Movie> movies;
   
  const CardSwiperScreen({
    Key? key, 
    required this.movies
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;

  if(movies.isEmpty){
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: const Center(
        child: CircularProgressIndicator(),
      ),  
    );
  }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , int index) {

          final movie = movies[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.urlCompleta)
                ),
            ),
          );
        },
      ),
      // color: const Color.fromARGB(255, 149, 10, 0),
    );
  }
}