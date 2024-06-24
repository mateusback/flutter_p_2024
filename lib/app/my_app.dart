import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:flutter_p_2024/app/view/grades_form.dart';

import 'view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal de Horas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        Routes.HOME: (context) => HomePage(),
        Routes.GRADES_FORM: (context) => GradesForm(),
      },
    );
  }
}
