import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection_container.dart';
import 'package:movie_app/presentation/bloc/category_movie/choice_bloc.dart';
import 'package:movie_app/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:movie_app/presentation/pages/dashboard_view.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: const Color(0xff0A0A0A),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: Colors.grey,
            backgroundColor: Color(0xff0A0A0A),
          )),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChoiceBloc(),
          ),
          BlocProvider(
              create: (context) => DashboardBloc(),
              child: const DashboardPage()),
          BlocProvider(
            create: (context) =>
                getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
          ),
          BlocProvider(
            create: (context) =>
                getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
          ),
        ],
        child: const DashboardPage(),
      ),
    );
  }
}
