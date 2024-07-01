import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/injection.dart';

import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  //insertTestSubject();
  runApp(const MyApp());
}
