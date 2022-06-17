import 'package:domain/driver_break_state.dart';
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
    state: ref.read(driverBreakStateProvider),
  ),
);

class _DriverBreakStateNotifier extends ChangeNotifier {
  final DriverBreakState _state;

  _DriverBreakStateNotifier({required DriverBreakState state}) : _state = state;

  void setTo(BreakDuration duration) {
    _state.setDuration(duration);
    notifyListeners();
  }

  String display() => _state.toString();
}
