import 'package:domain/calculator.dart';
import 'package:flutter/foundation.dart';

class Incrementer {
  final Calculator _calculator;

  @visibleForTesting
  Incrementer({required Calculator calculator}) : _calculator = calculator;

  Incrementer.poorMansProvider() : this(calculator: Calculator());

  Future<int> increment(int currentValue) {
    if (currentValue < 0) {
      throw ArgumentError.value(currentValue, "Value must be non-negative");
    }

    return Future.value(_calculator.addOne(currentValue));
  }
}
