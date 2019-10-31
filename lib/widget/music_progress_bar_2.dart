import 'package:flutter/material.dart';

class MyProgressBar extends StatefulWidget {
  Function onChanged;
  Function onChangeStart;
  Function onChangeEnd;

  int duration = 0;
  int position = 0;

  MyProgressBar({Key key, this.duration, this.position, this.onChanged, this.onChangeStart, this.onChangeEnd}): super(key: key);

  _MyProgressBarState createState() => _MyProgressBarState();

}

class _MyProgressBarState extends State<MyProgressBar> {
  
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(_getFormatTime(widget.position),
            style: TextStyle(color: Colors.white, fontSize: 12)),
        Expanded(
          child: SliderTheme(
            data: theme.sliderTheme.copyWith(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
            ),
            child: Slider.adaptive(
              value: widget.position.toDouble(),
              min: 0.0,
              max: widget.duration == 0 ? 1.0 : widget.duration.toDouble(),
              onChanged: (double value) {
                widget.onChanged(value);
              },
              onChangeStart: (double value) {
                widget.onChangeStart(value);
              },
              onChangeEnd: (double value) {
                widget.onChangeEnd(value);
              },
            ),
          )
        ),
        Text(
          _getFormatTime(widget.duration),
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  String _getFormatTime(int seconds) {
    int minute = seconds ~/ 60;
    int hour = minute ~/ 60;
    String strHour = hour == 0 ? '' : '$hour:';
    return "$strHour${_getTimeString(minute % 60)}:${_getTimeString(seconds % 60)}";
  }

  String _getTimeString(int value) {
    return value > 9 ? "$value" : "0$value";
  }
}