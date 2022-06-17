import 'package:application/providers.dart';
import 'package:domain/driver_break_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DriverBreaksView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverBreakState = ref.watch(driverBreakStateNotifierProvider);

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
