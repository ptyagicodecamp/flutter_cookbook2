import 'package:flutter/material.dart';

import 'codefile.dart';
import 'home.dart';
import 'patterns/bloc_pattern.dart';
import 'patterns/flutter_bloc.dart';
import 'screen_args.dart';
import 'unknown.dart';

const String HOME = "/";

const String SHOW_CODE_FILE = 'SHOW_CODE_FILE';
const String BLOC_PATTERN = 'BLOC_PATTERN';
const String BLOC_LIB = 'BLOC_LIB';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case BLOC_PATTERN:
      return MaterialPageRoute(builder: (context) => FlutterBlocCounterApp());
      break;

    case BLOC_PATTERN:
      return MaterialPageRoute(builder: (context) => BlocPatternCounterApp());
      break;

    case SHOW_CODE_FILE:
      final ScreenArguments screenArgs = routeSettings.arguments;

      return MaterialPageRoute(
          builder: (context) => CodeFileWidget(
                pageName: screenArgs.pageName,
                recipeName: screenArgs.recipeName,
                codeFilePath: screenArgs.codeFilePath,
                codeGithubPath: screenArgs.codeGithubPath,
              ));
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
