import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Disabled Buttons"),
          ),
          body: DisabledButtons(),
        ),
      ),
    );

class DisabledButtons extends StatefulWidget {
  @override
  _DisabledButtonsState createState() => _DisabledButtonsState();
}

class _DisabledButtonsState extends State<DisabledButtons> {
  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text("Disabled Button"),
                onPressed: null,
                disabledColor: Colors.black12,
                disabledElevation: 1,
                disabledTextColor: Colors.blueGrey,
              ),
              RaisedButton(
                child: Text("RaisedButton"),
                onPressed: () => print("Clicked"),
                elevation: 10,
                color: Colors.blue,
                textColor: Colors.white,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                child: Text("Disabled Button"),
                onPressed: null,
                disabledColor: Colors.black12,
                disabledTextColor: Colors.blueGrey,
              ),
              FlatButton(
                child: Text("FlatButton"),
                onPressed: () => print("Clicked"),
                color: Colors.green,
                textColor: Colors.white,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text("Disabled Button"),
                onPressed: null,
              ),
              TextButton(
                child: Text("TextButton"),
                onPressed: () => print("Clicked"),
              )
            ],
          )
        ],
      ),
    );
  }
}
