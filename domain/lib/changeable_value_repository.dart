import 'package:domain/changeable_value.dart';

abstract class ChangeableValueRepository {
  Future<ChangeableValue?> fetch(String id);
  Future<void> set(ChangeableValue value);
}
