import 'package:domain/changeable_value.dart';
import 'package:domain/changeable_value_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_flutter/application/incrementer.dart';

import 'incrementer_test.mocks.dart';

@GenerateMocks([ChangeableValueRepository])
void main() {
  group("Incrementer", () {
    late MockChangeableValueRepository repository;
    late Incrementer incrementer;
    final staticValueId = "SingletonValue";

    setUp(() {
      repository = MockChangeableValueRepository();
      incrementer = Incrementer(repository: repository);
    });

    group("given no current value", () {
      setUp(() {
        when(repository.fetch(staticValueId)).thenAnswer((_) async => null);
      });

      group("when getting the current value", () {
        late int? currentValue;

        setUp(() async {
          currentValue = await incrementer.getCurrent();
        });

        test("returns null", () {
          expect(currentValue, isNull);
        });
      });

      group("when incrementing the value", () {
        late int incrementedValue;

        setUp(() async {
          incrementedValue = await incrementer.increment();
        });

        test("returns 1", () {
          expect(incrementedValue, 1);
        });
      });
    });

    group("given a current value exists", () {
      late ChangeableValue currentValue;

      setUp(() {
        currentValue = ChangeableValue(staticValueId, 10);

        when(repository.fetch(staticValueId))
            .thenAnswer((_) async => currentValue);
      });

      group("when getting the current value", () {
        late int? currentValue;
        late int expectedValue;

        setUp(() async {
          expectedValue = 10;
          currentValue = await incrementer.getCurrent();
        });

        test("returns the value", () {
          expect(currentValue, expectedValue);
        });
      });

      group("when incrementing the value", () {
        late int incrementedValue;
        late int expectedValue;

        setUp(() async {
          expectedValue = 11;
          incrementedValue = await incrementer.increment();
        });

        test("returns the incremented value", () {
          expect(incrementedValue, expectedValue);
        });
      });
    });
  });
}
