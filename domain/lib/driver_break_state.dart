class DriverBreakState {
  final DriverBreakStateRepository _repository;
  BreakDuration? _currentDuration;

  DriverBreakState({required DriverBreakStateRepository repository})
      : _repository = repository;

  void setDuration(BreakDuration duration) {
    _currentDuration = duration;

    _repository.store(duration);
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
