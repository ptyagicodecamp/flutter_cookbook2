import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  RecipeWidget(
    title: 'Architecture Patterns',
    description: '',
    children: [
      RecipeWidget(
        title: "BloC Pattern",
        description: "Default Counter App using BloC Pattern",
        pageName: router.BLOC_PATTERN,
        codeFilePath: "lib/patterns/bloc_pattern.dart",
        codeGithubPath: "",
        children: [],
      ),
      RecipeWidget(
        title: "BloC Library",
        description: "Default Counter App using BloC Library",
        pageName: router.BLOC_LIB,
        codeFilePath: "lib/patterns/flutter_bloc.dart",
        codeGithubPath: "",
        children: [],
      ),
    ],
  ),
  RecipeWidget(
    title: "Responsive Widgets",
    description:
        "Widgets helpful in creating responsive layouts.",
    children: [
      RecipeWidget(
        title: "FittedBox",
        description:
        "FittedBox fits it child with in the given space during layout to avoid overflows.",
        pageName: router.FITTED_BOX,
        codeFilePath: "lib/responsive_widgets/fitted_box.dart",
        codeGithubPath: "",
        children: [],
      ),
    ],
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
            return recipes[index].children.isNotEmpty
                ? ExpansionTile(
                    title: Text(recipes[index].title),
                    children: [
                      Column(
                        children: recipes[index].children,
                      )
                    ],
                  )
                : recipes[index];
          }),
    );
  }

  List<Widget> _buildExpandable(List<RecipeWidget> subWidgets) {
    List<Widget> listing = [];
    for (RecipeWidget recipe in subWidgets)
      listing.add(
        ListTile(
          title: Text(recipe.title),
        ),
      );

    return listing;
  }
}
