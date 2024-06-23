import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/Movie.dart';

class TredingMovieCard extends StatelessWidget {
  const TredingMovieCard(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 220,
        width: 150,
        child: Ink.image(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BottomMovieCard extends StatelessWidget {
  const BottomMovieCard(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 150,
        width: 80,
        child: Ink.image(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
