import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//void main() {
//  runApp(FlutterBlocCounterApp());
//}

enum CounterEvent { increment }

//Note:
// #1 (adding events), #3 (mapping event to state logic-business logic), #6 (re-building widgets to reflect new state on the interface)
//Managed by BLoC library: #2 (initializing to listening to the event stream), #4 (adding state to state stream's sink), #5-providing state's stream to interface

//#2: Taken care by Bloc library (listening to events)
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState);

  //#3: Mapping events to their corresponding state based on the business logic
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }

  //#4 + #5: Stream<State> provides the stream of state. Heavy lifting done by BLoC library
}

class FlutterBlocCounterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BLoC Library Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({Key key, this.title}) : super();

  final String title;

  //#2: Initializing Bloc (listening)
  final CounterBloc _counterBloc = CounterBloc(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            //#6: Rebuilding Text widget for new state (count)
            BlocBuilder<CounterBloc, int>(
              bloc: _counterBloc,
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //#1: Events added to eventController's sink
        onPressed: () => _counterBloc.add(CounterEvent.increment),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }
}
