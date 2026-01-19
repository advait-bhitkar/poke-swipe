
import 'package:flutter/material.dart';
import 'core/bootstrap.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => runApp(const MyApp()));
}
