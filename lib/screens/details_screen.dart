import 'package:app_peliculas/widgets/casting_cards.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
 
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCardsScreen()
            ])
            )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 149, 10, 0),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only( bottom: 10 ),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle( fontSize: 16 ),
          ),
        ),

        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
              ),
          ),

          const SizedBox( width: 20 ),

          Column(
            children: [
              Text('movie.title', style: textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('movie.original.title', style: textTheme.titleMedium, overflow: TextOverflow.ellipsis),

              Row(
                children: [
                  const Icon(Icons.star_outlined, size: 15, color: Colors.grey),
                  const SizedBox(width: 5 ),
                  Text('movie.voteAverage', style: textTheme.bodySmall,)                ],
              )
            ],
          )

        ]
        ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Sunt aliqua elit occaecat minim culpa incididunt culpa ut. In incididunt sint laboris exercitation occaecat eiusmod nostrud deserunt nisi exercitation occaecat occaecat. Velit est sit magna magna voluptate quis sint culpa Lorem labore. Nostrud ea est dolor ea ut est do adipisicing ullamco labore. Nulla aliqua excepteur velit veniam et excepteur qui ullamco velit anim est. Mollit laboris ad laborum consequat do qui deserunt ad voluptate nostrud labore cupidatat proident. Commodo sit nulla reprehenderit nulla duis reprehenderit deserunt ut nisi aute.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}