import 'package:flutter_test/flutter_test.dart';

import '../lib/patterns/bloc_pattern.dart';

void main() {
  group('CounterBloc (No Library)', () {
    CounterBloc counterBloc;

    //Setting up
    setUp(() {
      counterBloc = CounterBloc();
    });

    //Tearing down
    tearDown(() {
      counterBloc.dispose();
    });
  });
}
