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
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/patterns/bloc_pattern.dart",
        children: [],
      ),
      RecipeWidget(
        title: "BloC Library",
        description: "Default Counter App using BloC Library",
        pageName: router.BLOC_LIB,
        codeFilePath: "lib/patterns/flutter_bloc.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/patterns/flutter_bloc.dart",
        children: [],
      ),
    ],
  ),
  RecipeWidget(
    title: "Responsive Widgets",
    description: "Widgets helpful in creating responsive layouts.",
    children: [
      RecipeWidget(
        title: "FittedBox",
        description:
            "FittedBox fits it child with in the given space during layout to avoid overflows.",
        pageName: router.FITTED_BOX,
        codeFilePath: "lib/responsive_widgets/progress_indicator_loading.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/responsive_widgets/progress_indicator_loading.dart#L80:L84",
        children: [],
      ),
      RecipeWidget(
        title: "Expanded",
        description:
            "Expanded widget allows child of Row, Column, or Flex widgets expand to fill the available space along the main axis of parent widget.",
        pageName: router.EXPANDED,
        codeFilePath: "lib/responsive_widgets/expanded.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/responsive_widgets/expanded.dart",
        children: [],
      ),
      RecipeWidget(
        title: "Flexible",
        description:
            "Expanded widget allows child of Row, Column, or Flex widgets expand to fill the available space along the main axis of parent widget.",
        pageName: router.FLEXIBLE,
        codeFilePath: "lib/responsive_widgets/flexible.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/responsive_widgets/flexible.dart",
        children: [],
      ),
      RecipeWidget(
        title: "FractionallySizedBox",
        description: "Sizes its child to a fraction of total available space.",
        pageName: router.FRACTIONALLY_SIZED_BOX,
        codeFilePath: "lib/responsive_widgets/fractionally_sized_box.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/responsive_widgets/fractionally_sized_box.dart",
        children: [],
      ),
      RecipeWidget(
        title: "LayoutBuilder",
        description:
            "LayoutBuilder builds widgets dynamically as per the constraint passed by the parent.",
        pageName: router.LAYOUT_BUILDER,
        codeFilePath: "lib/responsive_widgets/layoutbuilder.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/responsive_widgets/layoutbuilder.dart",
        children: [],
      ),
      RecipeWidget(
        title: "Wrap",
        description:
            "Wrap widget is helpful when Row and Column widgets run out of room.",
        pageName: router.WRAP,
        codeFilePath: "lib/responsive_widgets/wrap.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/responsive_widgets/wrap.dart",
        children: [],
      ),
    ],
  ),
  RecipeWidget(
    title: "Widgets",
    description: "",
    pageName: router.WIDGETS,
    codeFilePath: "",
    codeGithubPath: "",
    children: [
      RecipeWidget(
        title: "Custom LinearProgressIndicator",
        description: "Customized linear progress bar",
        pageName: router.CUSTOM_LINEAR_PROGRESS_BAR,
        codeFilePath: "lib/widgets/custom_linearprogress_indicator.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/widgets/custom_linearprogress_indicator.dart",
        children: [],
      ),
      RecipeWidget(
        title: "Animated LinearProgressIndicator",
        description: "Animated linear progress bar (Continuous)",
        pageName: router.ANIM_LINEAR_PROGRESS_BAR,
        codeFilePath: "lib/widgets/anim_linearprogress_indicator.dart",
        codeGithubPath:
            "https://github.com/ptyagicodecamp/flutter_cookbook2/blob/master/lib/widgets/anim_linearprogress_indicator.dart",
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
