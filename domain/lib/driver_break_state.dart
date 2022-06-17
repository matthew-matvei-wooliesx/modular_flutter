class DriverBreakState {
  BreakDuration? _currentDuration;

  void setDuration(BreakDuration duration) {
    _currentDuration = duration;
  }

  @override
  String toString() =>
      _currentDuration != null ? "${_currentDuration!.display()} started" : "";
}

abstract class DriverBreakStateRepository {
  Future<void> store(BreakDuration duration);
}

abstract class BreakDuration {
  String display();
}

class FifteenMinuteBreak implements BreakDuration {
  @override
  String display() => "15min break";
}

class ThirtyMinuteBreak implements BreakDuration {
  @override
  String display() => "30min break";
}
