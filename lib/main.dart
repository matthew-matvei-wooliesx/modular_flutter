import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modular_flutter/app.dart';

void main() async {
  runApp(ProviderScope(child: const App()));
}
