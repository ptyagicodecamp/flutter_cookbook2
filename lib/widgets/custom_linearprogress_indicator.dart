import 'package:flutter/material.dart';

/// Animated LinearProgressIndicator
void main() => runApp(CustomLinearProgressIndicatorDemo());

class CustomLinearProgressIndicatorDemo extends StatefulWidget {
  @override
  _CustomLinearProgressIndicatorDemoState createState() =>
      _CustomLinearProgressIndicatorDemoState();
}

class _CustomLinearProgressIndicatorDemoState
    extends State<CustomLinearProgressIndicatorDemo> {
  double _progress = 0;
  Color fgColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    Color bgColor = fgColor.withOpacity(0.3);
    if (_progress >= 0.7) {
      fgColor = Colors.green;
    } else if (_progress >= 0.5) {
      fgColor = Colors.yellow;
    } else {
      fgColor = Colors.red;
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("LinearProgressIndicator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            CustomLinearProgressIndicator(
              bgColor: bgColor,
              fgColor: fgColor,
              progressValue: _progress,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    child: Icon(Icons.thumb_up),
                    onPressed: () {
                      setState(() {
                        _progress = (_progress + 0.1).clamp(0.0, 1.0);
                        print(_progress);
                      });
                    }),
                RaisedButton(
                    child: Icon(Icons.thumb_down),
                    onPressed: () {
                      setState(() {
                        _progress = (_progress - 0.1).clamp(0.0, 1.0);
                        print(_progress);
                      });
                    })
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class CustomLinearProgressIndicator extends StatefulWidget {
  final bgColor;
  final fgColor;
  final progressValue;

  const CustomLinearProgressIndicator(
      {Key key, this.bgColor, this.fgColor, this.progressValue})
      : super(key: key);
  @override
  _CustomLinearProgressIndicatorState createState() =>
      _CustomLinearProgressIndicatorState();
}

class _CustomLinearProgressIndicatorState
    extends State<CustomLinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: LinearProgressIndicator(
        minHeight: 50,
        value: this.widget.progressValue,
        backgroundColor: this.widget.bgColor,
        valueColor: AlwaysStoppedAnimation<Color>(this
            .widget
            .fgColor), //Animation that always stops at the given value
      ),
    );
  }
}
