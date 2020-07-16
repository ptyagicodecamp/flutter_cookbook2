import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  RecipeWidget(
    "BloC Pattern",
    "Default Counter App using BloC Pattern",
    router.BLOC_PATTERN,
    "lib/patterns/bloc_pattern.dart",
    "",
  ),
  RecipeWidget(
    "BloC Library",
    "Default Counter App using BloC Library",
    router.BLOC_PATTERN,
    "lib/patterns/flutter_bloc.dart",
    "",
  ),
];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Cookbook'),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return recipes[index];
          }),
    );
  }
}
