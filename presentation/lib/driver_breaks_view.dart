import 'package:domain/driver_break_state.dart';
import 'package:domain/driver_break_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/providers.dart';

class DriverBreaksView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverBreakState = ref.watch(_driverBreakStateNotifierProvider);

    return Column(
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () => driverBreakState.setTo(FifteenMinuteBreak()),
                child: Text("Start 15min break")),
            TextButton(
                onPressed: () => driverBreakState.setTo(ThirtyMinuteBreak()),
                child: Text("Start 30min break"))
          ],
        ),
        if (driverBreakState.display().isNotEmpty)
          Text(driverBreakState.display())
      ],
    );
  }
}

final _driverBreakStateNotifierProvider = ChangeNotifierProvider(
  (ref) => _DriverBreakStateNotifier(
    useCase: ref.read(driverBreakUseCaseProvider),
  ),
);

class _DriverBreakStateNotifier extends ChangeNotifier {
  final DriverBreakUseCase _useCase;
  DriverBreakState _driverBreakState = DriverBreakState();

  _DriverBreakStateNotifier({required DriverBreakUseCase useCase})
      : _useCase = useCase;

  void setTo(BreakDuration duration) async {
    _driverBreakState = await _useCase.setDriverBreakDuration(
      _driverBreakState,
      duration,
    );

    notifyListeners();
  }

  String display() => _driverBreakState.toString();
}
