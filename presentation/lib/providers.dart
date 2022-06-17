import 'package:application/driver_break_use_case.dart';
import 'package:data/in_memory_driver_break_state_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverBreakUseCaseProvider = Provider((ref) => DriverBreakUseCase(
    repository: ref.read(_driverBreakStateRepositoryProvider)));

final _driverBreakStateRepositoryProvider = Provider(
  (_) => InMemoryDriverBreakStateRepository(),
);
