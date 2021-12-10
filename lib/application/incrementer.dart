import 'package:domain/changeable_value_repository.dart';
import 'package:flutter/foundation.dart';

class Incrementer {
  final ChangeableValueRepository _repository;

  @visibleForTesting
  Incrementer({required ChangeableValueRepository repository})
      : _repository = repository;

  // Incrementer.poorMansProvider() : this(calculator: Calculator());

  Future<int?> getCurrent() {
    throw UnimplementedError();
  }

  Future<int> increment() {
    throw UnimplementedError();
  }
}
