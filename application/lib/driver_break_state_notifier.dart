import 'package:domain/driver_break_state.dart';
import 'package:flutter/foundation.dart';

class DriverBreakStateNotifier extends ChangeNotifier {
  final DriverBreakState _state;

  DriverBreakStateNotifier({required DriverBreakState state}) : _state = state;

  void setTo(BreakDuration duration) {
    _state.setDuration(duration);
    notifyListeners();
  }

  String display() => _state.toString();
}
