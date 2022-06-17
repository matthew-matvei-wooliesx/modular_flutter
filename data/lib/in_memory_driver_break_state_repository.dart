import 'package:domain/driver_break_state.dart';

class InMemoryDriverBreakStateRepository implements DriverBreakStateRepository {
  _DurationOptions? currentDuration;

  @override
  Future<void> store(BreakDuration duration) async {
    if (duration is FifteenMinuteBreak) {
      currentDuration = _DurationOptions.fifteenMins;
    } else if (duration is ThirtyMinuteBreak) {
      currentDuration = _DurationOptions.thirtyMins;
    } else {
      throw ArgumentError.value(duration, "duration", "Unsupported duration");
    }
  }
}

enum _DurationOptions { fifteenMins, thirtyMins }
