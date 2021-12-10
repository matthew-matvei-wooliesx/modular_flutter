import 'package:data/changeable_value_repository.dart';
import 'package:domain/changeable_value.dart';
import 'package:domain/changeable_value_repository.dart';
import 'package:flutter/foundation.dart';

class Incrementer {
  final String _staticValueId = "SingletonValue";
  final ChangeableValueRepository _repository;

  @visibleForTesting
  Incrementer({required ChangeableValueRepository repository})
      : _repository = repository;

  Incrementer.poorMansProvider()
      : this(repository: ChangeableValueRepositoryImpl());

  Future<int?> getCurrent() async {
    final current = await _repository.fetch(_staticValueId);
    return current?.value;
  }

  Future<int> increment() async {
    final current = await _repository.fetch(_staticValueId);

    final newValue = current == null
        ? ChangeableValue(_staticValueId, 1)
        : (current..increment());

    await _repository.set(newValue);

    return newValue.value;
  }
}
