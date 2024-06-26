import 'package:app_peliculas/models/movie.dart';
import 'package:flutter/material.dart';

class MovieSliderScreen extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSliderScreen({Key? key, required this.movies, this.title, required this.onNextPage}) : super(key: key);

  @override
  State<MovieSliderScreen> createState() => _MovieSliderScreenState();
}

class _MovieSliderScreenState extends State<MovieSliderScreen> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if(widget.title != null)
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            const SizedBox(height: 5),

            Expanded(
                child: ListView.builder(
                  controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.movies.length,
                    itemBuilder: (_, int index) => _MoviePoster(movie: widget.movies[index],)
                    ))
          ],
        ));
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  const _MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context, 'details', arguments: 'movie-details'
              ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.urlCompleta),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
                ),
            ),
          ),


             Text(
              movie.title,
              style: TextStyle(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
      ]),
    );
  }
}
