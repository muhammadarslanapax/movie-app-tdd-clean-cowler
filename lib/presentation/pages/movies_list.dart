import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/Movie.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_state.dart';

import '../bloc/category_movie/choice_bloc.dart';
import '../widgets/choice.dart';
import '../widgets/movie_card.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    final List<String> choices = [
      'Popular',
      'Top Rated',
      "Upcoming",
      'Now Playing'
    ];

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(movies.length, (index) {
                    final movie = movies[index];
                    return Stack(
                      children: [
                        TredingMovieCard(movie),
                        Positioned(
                            bottom: 0,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontSize: height * 0.08,
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor, // Grey color for the text
                                shadows: const [
                                  Shadow(
                                    color: Colors.blue, // Blue outline color
                                    offset: Offset(
                                        1, 1), // Adjust the outline position
                                    blurRadius:
                                        2, // Adjust the outline thickness
                                  ),
                                ],
                              ),
                            ))
                      ],
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            BlocBuilder<ChoiceBloc, int>(
              builder: (context, selectedIndex) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(choices.length, (index) {
                    return CustomChoiceChip(
                      label: choices[index],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        context.read<ChoiceBloc>().selectChoice(index);
                      },
                    );
                  }),
                );
              },
            ),
            BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PopularMoviesLoaded) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.movies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return BottomMovieCard(movies[index]);
                    },
                  );
                } else if (state is PopularMoviesError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
          ]),
        ),
      ],
    );
  }
}
