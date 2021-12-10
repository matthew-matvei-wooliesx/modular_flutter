import 'package:domain/changeable_value.dart';
import 'package:hive/hive.dart';

part 'changeable_value_entity.g.dart';

@HiveType(typeId: 0)
class ChangeableValueEntity {
  @HiveField(0)
  String id;

  @HiveField(1)
  int value;

  ChangeableValueEntity({
    required this.id,
    required this.value,
  });

  ChangeableValueEntity.fromDomain(ChangeableValue changeableValue)
      : id = changeableValue.id,
        value = changeableValue.value;

  ChangeableValue toDomain() {
    return ChangeableValue(id, value);
  }
}
