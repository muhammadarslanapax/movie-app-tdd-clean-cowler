import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:movie_app/presentation/pages/movies_list.dart';

import '../bloc/dashboard/dashboard_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "What do you want to watch?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
                width: width * 0.9,
                child: TextFormField(
                  onTap: () {
                    BlocProvider.of<DashboardBloc>(context)
                        .add(TabChange(tabIndex: 1));
                  },
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: const Icon(Icons.search, color: Colors.grey),
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      fillColor: const Color(0xff1f1f1f),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(18))),
                )),
          ),
        ),
      ),
      body: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const CircularProgressIndicator();
          } else if (state is TrendingMoviesLoaded) {
            return MoviesList(movies: state.movies);
          } else if (state is TrendingMoviesError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
