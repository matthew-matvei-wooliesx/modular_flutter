import 'package:data/changeable_value_entity.dart';
import 'package:domain/changeable_value.dart';
import 'package:domain/changeable_value_repository.dart';
import 'package:hive/hive.dart';

class ChangeableValueRepositoryImpl implements ChangeableValueRepository {
  @override
  Future<ChangeableValue?> fetch(String id) async {
    return await _getBox()
        .then((box) => box.get(id))
        .then((value) => value?.toDomain());
  }

  @override
  Future<void> set(ChangeableValue value) async {
    await _getBox().then(
      (box) => box.put(
        value.id,
        ChangeableValueEntity.fromDomain(value),
      ),
    );
  }

  static Future<Box<ChangeableValueEntity>> _getBox() async {
    return Hive.openBox("ChangeableValues");
  }
}
