import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/injection.dart';
import 'package:flutter_p_2024/app/tools/dabase_init.dart';

import 'app/my_app.dart';

void main() async {
  await setupInjection();
  //insertTestSubject();
  runApp(const MyApp());
}
