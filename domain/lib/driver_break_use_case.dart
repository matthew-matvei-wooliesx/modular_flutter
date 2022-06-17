import 'package:domain/driver_break_state.dart';

class DriverBreakUseCase {
  final DriverBreakStateRepository _repository;

  DriverBreakUseCase({required DriverBreakStateRepository repository})
      : _repository = repository;

  Future<DriverBreakState> setDriverBreakDuration(
      DriverBreakState driverBreak, BreakDuration duration) async {
    driverBreak.setDuration(duration);
    await _repository.store(duration);
    return driverBreak;
  }
}
