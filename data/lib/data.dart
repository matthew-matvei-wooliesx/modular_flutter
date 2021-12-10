import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'changeable_value_entity.dart';

Future<void> initialiseDataLayer() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ChangeableValueEntityAdapter());
}
