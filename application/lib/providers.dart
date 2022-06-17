import 'package:application/driver_break_state_notifier.dart';
import 'package:data/in_memory_driver_break_state_repository.dart';
import 'package:domain/driver_break_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverBreakStateNotifierProvider = ChangeNotifierProvider(
  (ref) => DriverBreakStateNotifier(
    state: ref.read(_driverBreakStateProvider),
  ),
);

final _driverBreakStateProvider = Provider(
  (ref) => DriverBreakState(
    repository: ref.read(_driverBreakStateRepositoryProvider),
  ),
);

final _driverBreakStateRepositoryProvider = Provider(
  (_) => InMemoryDriverBreakStateRepository(),
);
