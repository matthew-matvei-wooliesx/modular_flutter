import 'package:flutter/material.dart';

class DriverBreaksView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DriverBreaksViewState();
}

class DriverBreaksViewState extends State<DriverBreaksView> {
  String? _breakDisplay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: _handleBreakStarted(_BreakDuration.fifteenMinutes),
              child: Text("Start 15min break"),
            ),
            TextButton(
              onPressed: _handleBreakStarted(_BreakDuration.thirtyMinutes),
              child: Text("Start 30min break"),
            ),
            if (_breakDisplay != null) Text(_breakDisplay!)
          ],
        )
      ],
    );
  }

  void Function() _handleBreakStarted(_BreakDuration duration) => () {
        if (duration == _BreakDuration.fifteenMinutes) {
          setState(() {
            _breakDisplay = "15min break started";
          });
        } else {
          setState(() {
            _breakDisplay = "30min break started";
          });
        }
      };
}

enum _BreakDuration { fifteenMinutes, thirtyMinutes }
