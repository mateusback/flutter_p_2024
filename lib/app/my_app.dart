import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';
import 'package:flutter_p_2024/app/view/grade/grade_form.dart';
import 'package:flutter_p_2024/app/view/grade/grade_list.dart';
import 'package:flutter_p_2024/app/view/subject/subject_list.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        Routes.HOME: (context) => HomePage(),
        Routes.SUBJECT_LIST: (context) => SubjectList(),
        Routes.GRADE_FORM: (context) => GradeForm(),
        Routes.GRADES_LIST: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Subject;
          return GradeList(subject: args);
        },
      },
    );
  }
}
