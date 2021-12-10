import 'package:domain/calculator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_flutter/application/incrementer.dart';

void main() {
  group("Incrementer", () {
    late int value;
    late int incrementedValue;

    group("given a zero value", () {
      setUp(() {
        value = 0;
      });

      group("when incrementing the value", () {
        setUp(() async {
          final incrementer = Incrementer(calculator: Calculator());
          incrementedValue = await incrementer.increment(value);
        });

        test("increments the value", () {
          expect(incrementedValue, value + 1);
        });
      });
    });

    group("given a positive value", () {
      setUp(() {
        value = 1;
      });

      group("when incrementing the value", () {
        setUp(() async {
          final incrementer = Incrementer(calculator: Calculator());
          incrementedValue = await incrementer.increment(value);
        });

        test("increments the value", () {
          expect(incrementedValue, value + 1);
        });
      });
    });

    group("given a negative value", () {
      setUp(() {
        value = -1;
      });

      group("when incrementing the value", () {
        late Future<int> Function() increment;

        setUp(() async {
          final incrementer = Incrementer(calculator: Calculator());
          increment = () => incrementer.increment(value);
        });

        test("throws an ArgumentError", () {
          expect(increment, throwsArgumentError);
        });
      });
    });
  });
}
