import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/view/complementary_activity/complementary_activity_list.dart';
import 'package:flutter_p_2024/app/view/grade/grade_form.dart';
import 'package:flutter_p_2024/app/view/grade/grade_list.dart';
import 'package:flutter_p_2024/app/view/home_page.dart';
import 'package:flutter_p_2024/app/view/subject/subject_form.dart';
import 'package:flutter_p_2024/app/view/subject/subject_list.dart';

class Routes {
  static const String HOME = '/';
  static const String SUBJECT_LIST = 'subject-list';
  static const String GRADES_LIST = 'grades-list';
  static const String GRADE_FORM = 'grade-form';
  static const String SUBJECT_FORM = 'subject-form';
  static const String COMPLEMENTARY_LIST = 'complementary-list';

  static Map<String, Widget Function(BuildContext)> configRoutes() {
    return {
      HOME: (context) => HomePage(),
      SUBJECT_LIST: (context) => SubjectList(),
      SUBJECT_FORM: (context) => SubjectForm(),
      GRADE_FORM: (context) => GradeForm(),
      GRADES_LIST: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Subject;
        return GradeList(subject: args);
      },
      COMPLEMENTARY_LIST: (context) => ComplementaryActivityList(),
    };
  }
}
