import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movies/search_movies_event.dart';

import '../bloc/search_movies/search_movies_bloc.dart';
import '../bloc/search_movies/search_movies_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Search"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (query) {
              moviesBloc.add(SearchMovies(query));
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              hintText: 'Search for movies...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchLoaded || state is SearchResults) {
                  final movies = (state is SearchLoaded)
                      ? (state).movies
                      : (state as SearchResults).results;

                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return ListTile(
                        title: Text(movie.title),
                        subtitle: Text(movie.overview),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No movies found'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
