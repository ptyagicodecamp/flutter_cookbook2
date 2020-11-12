import 'package:flutter/material.dart';

/// Animated LinearProgressIndicator
void main() => runApp(AnimatedLinearProgressIndicatorDemo());

class AnimatedLinearProgressIndicatorDemo extends StatefulWidget {
  @override
  _AnimatedLinearProgressIndicatorDemoState createState() =>
      _AnimatedLinearProgressIndicatorDemoState();
}

class _AnimatedLinearProgressIndicatorDemoState
    extends State<AnimatedLinearProgressIndicatorDemo> {
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
          title: Text("Animated LinearProgressIndicator"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            AnimatedLinearProgressIndicator(
              bgColor: bgColor,
              fgColor: fgColor,
              progressValue: _progress,
              animDuration: Duration(milliseconds: 500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    child: Icon(Icons.thumb_up),
                    onPressed: () {
                      setState(() {
                        _progress = (_progress + 0.1).clamp(0.0, 1.0);
                      });
                    }),
                RaisedButton(
                    child: Icon(Icons.thumb_down),
                    onPressed: () {
                      setState(() {
                        _progress = (_progress - 0.1).clamp(0.0, 1.0);
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

class AnimatedLinearProgressIndicator extends StatefulWidget {
  final bgColor;
  final fgColor;
  final progressValue;
  final Duration animDuration;

  const AnimatedLinearProgressIndicator(
      {Key key,
      this.bgColor,
      this.fgColor,
      this.progressValue,
      this.animDuration})
      : super(key: key);
  @override
  _AnimatedLinearProgressIndicatorState createState() =>
      _AnimatedLinearProgressIndicatorState();
}

class _AnimatedLinearProgressIndicatorState
    extends State<AnimatedLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _curve;
  Tween<double> _tween;
  Tween<Color> _bgColorTween;
  Tween<Color> _fgColorTween;

  @override
  void initState() {
    super.initState();

    this._animationController = AnimationController(
      duration: this.widget.animDuration ?? const Duration(seconds: 3),
      vsync: this,
    );

    this._curve = CurvedAnimation(
      parent: this._animationController,
      curve: Curves.easeInOut,
    );

    this._tween = Tween<double>(
      begin: 0,
      end: this.widget.progressValue,
    );

    this._animationController.forward();
  }

  @override
  void didUpdateWidget(AnimatedLinearProgressIndicator old) {
    super.didUpdateWidget(old);

    if (this.widget.progressValue != old.progressValue) {
      //Begin tween in continuation from last position of animation
      double begin =
          this._tween?.evaluate(this._curve) ?? old?.progressValue ?? 0;

      this._tween = Tween<double>(
        begin: begin,
        end: this.widget.progressValue ?? 1,
      );

      //Preserve background/foreground colors to show continuity
      if (this.widget.bgColor != old?.bgColor) {
        this._bgColorTween = ColorTween(
          begin: old?.bgColor ?? Colors.transparent,
          end: this.widget.bgColor ?? Colors.transparent,
        );
      } else {
        this._bgColorTween = null;
      }

      if (this.widget.fgColor != old.fgColor) {
        this._fgColorTween = ColorTween(
          begin: old?.fgColor,
          end: this.widget.fgColor,
        );
      } else {
        this._fgColorTween = null;
      }

      this._animationController
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    this._animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this._curve,
      builder: (context, child) {
        final bgColor =
            this._bgColorTween?.evaluate(this._curve) ?? this.widget.bgColor;
        final fgColor =
            this._fgColorTween?.evaluate(this._curve) ?? this.widget.fgColor;

        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: LinearProgressIndicator(
              minHeight: 50,
              value: this._tween.evaluate(this._curve),
              backgroundColor: bgColor,
              valueColor: AlwaysStoppedAnimation<Color>(
                  fgColor), //Animation that always stops at the given value
            ),
          ),
        );
      },
    );
  }
}
