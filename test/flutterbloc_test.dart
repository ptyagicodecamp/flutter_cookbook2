import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/patterns/flutter_bloc.dart';

void main() {
  group('CounterBloc (With Library)', () {
    CounterBloc counterBloc;

    //Setting up
    setUp(() {
      counterBloc = CounterBloc(0);
    });

    //Test
    test('Testing for initial', () {
      expect(counterBloc.state, 0);
    });

    blocTest(
      'Increasing Counter',
      build: () async => counterBloc,
      act: (bloc) async => bloc.add(CounterEvent.increment),
      expect: [1],
    );

    //Cleaning up
    tearDown(() {
      counterBloc.close();
    });
  });
}
