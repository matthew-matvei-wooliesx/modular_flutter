import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_flutter/main.dart';

void main() {
  testWidgets("A 15 minute Driver Break can be started", (tester) async {
    await tester.pumpWidget(ProviderScope(child: App()));

    await tester.startBreak(_BreakDuration.fifteenMinutes);

    expect(_findBreak(_BreakDuration.fifteenMinutes), findsOneWidget);
    expect(_findBreak(_BreakDuration.thirtyMinutes), findsNothing);
  });

  testWidgets("A 30 minute Driver Break can be started", (tester) async {
    await tester.pumpWidget(ProviderScope(child: App()));

    await tester.startBreak(_BreakDuration.thirtyMinutes);

    expect(_findBreak(_BreakDuration.thirtyMinutes), findsOneWidget);
    expect(_findBreak(_BreakDuration.fifteenMinutes), findsNothing);
  });
}

Finder _findBreak(_BreakDuration duration) {
  final breakText = duration == _BreakDuration.fifteenMinutes
      ? "15min break started"
      : "30min break started";

  return find.text(breakText);
}

extension _DriverBreaksExtensions on WidgetTester {
  Future<void> startBreak(_BreakDuration duration) async {
    final buttonText = duration == _BreakDuration.fifteenMinutes
        ? "Start 15min break"
        : "Start 30min break";

    await tap(find.widgetWithText(TextButton, buttonText));
  }
}

enum _BreakDuration { fifteenMinutes, thirtyMinutes }
