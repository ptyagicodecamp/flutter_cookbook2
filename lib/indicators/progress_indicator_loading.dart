import 'dart:async';

import 'package:flutter/material.dart';

/// Linear Progress Indicator
void main() => runApp(LinearProgressIndicatorDemo());

class LinearProgressIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLinearProgressIndicator(),
    );
  }
}

class MyLinearProgressIndicator extends StatefulWidget {
  @override
  _MyLinearProgressIndicatorState createState() =>
      _MyLinearProgressIndicatorState();
}

int indeterminate = 0;
int determinate = 1;

Map<int, String> dropdown = {
  indeterminate: "Indeterminate",
  determinate: 'Determinate',
};

class _MyLinearProgressIndicatorState extends State<MyLinearProgressIndicator> {
  @override
  void didUpdateWidget(MyLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _currentOption = 0;
  String dropDownValue = dropdown[0];
  bool isIndeterminate = true;

  double _progress = 0;

  @override
  void initState() {
    super.initState();
    updateContainer(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LinearProgressIndicator Widget"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: DropdownButton(
              hint:
                  dropDownValue == null ? Text('Select') : Text(dropDownValue),
              items: dropdown.keys
                  .map((e) => DropdownMenuItem(
                        child: Text(dropdown[e]),
                        onTap: () {
                          setState(() {
                            _currentOption = e;

                            updateContainer(_currentOption == 0
                                ? indeterminate
                                : determinate);
                          });
                        },
                        value: e,
                      ))
                  .toList(),
              onChanged: (newValue) {
                print(newValue);
                dropDownValue = dropdown[newValue];
              },
            ),
          )
        ],
      ),
      //Widget Usage
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isIndeterminate ? indeterminateWidget() : determinateWidget(),
        ),
      ),
    );
  }

  Widget indeterminateWidget() {
    return LinearProgressIndicator();
  }

  Widget determinateWidget() {
    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: 10,
          value: _progress,
          backgroundColor: Colors.black38,
          valueColor: AlwaysStoppedAnimation<Color>(
              Colors.red), //Animation that always stops at the given value
          semanticsLabel: "Semantic Label",
          semanticsValue: "Semantic Value",
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
                child: Text("Reset"),
                onPressed: () {
                  setState(() {
                    _progress = 0;
                  });
                }),
            RaisedButton(
                child: Text("Press"),
                onPressed: () {
                  setState(() {
                    _progress += 0.1;
                  });
                }),
            RaisedButton(
                child: Text("Auto"),
                onPressed: () {
                  setState(() {
                    _progress = 0;
                  });
                  timer();
                })
          ],
        )
      ],
    );
  }

  void timer() {
    Timer.periodic(
        Duration(milliseconds: 1),
        (Timer timer) => setState(() {
              if (_progress == 1) {
                timer
                    .cancel(); //Stop timer because progress reached to its maximum value.

              } else {
                _progress += 0.1;
              }
            }));
  }

  void updateContainer(int option) {
    switch (option) {
      case 0:
        setState(() {
          isIndeterminate = true;
        });
        break;
      case 1:
        setState(() {
          isIndeterminate = false;
        });
        break;
    }
  }
}
