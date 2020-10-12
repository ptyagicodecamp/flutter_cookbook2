import 'package:flutter/material.dart';
import 'package:flutter_cookbook2/responsive_widgets/fitted_box.dart';
import 'package:flutter_cookbook2/widgets/anim_linearprogress_indicator.dart';
import 'package:flutter_cookbook2/widgets/custom_linearprogress_indicator.dart';

import '../patterns/bloc_pattern.dart';
import '../patterns/flutter_bloc.dart';
import 'codefile.dart';
import 'home.dart';
import 'screen_args.dart';
import 'unknown.dart';

const String HOME = "/";

const String SHOW_CODE_FILE = 'SHOW_CODE_FILE';
const String BLOC_PATTERN = 'BLOC_PATTERN';
const String BLOC_LIB = 'BLOC_LIB';
const FITTED_BOX = 'FITTED_BOX';
const String WIDGETS = 'WIDGETS';
const String CUSTOM_LINEAR_PROGRESS_BAR = 'CUSTOM_LINEAR_PROG_BAR';
const String ANIM_LINEAR_PROGRESS_BAR = 'ANIM_LINEAR_PROG_BAR';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case CUSTOM_LINEAR_PROGRESS_BAR:
      return MaterialPageRoute(
          builder: (context) => CustomLinearProgressIndicatorDemo());
      break;
    case ANIM_LINEAR_PROGRESS_BAR:
      return MaterialPageRoute(
          builder: (context) => AnimatedLinearProgressIndicatorDemo());
      break;

    case FITTED_BOX:
      return MaterialPageRoute(builder: (context) => FittedBoxDemo());
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
