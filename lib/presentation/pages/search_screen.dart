import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
        centerTitle: true,
        actions: const [Icon(Icons.error_outline)],
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
