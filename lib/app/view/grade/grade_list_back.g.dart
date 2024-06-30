// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GradeListBack on _GradeListBack, Store {
  late final _$listAtom = Atom(name: '_GradeListBack.list', context: context);

  @override
  Future<List<Grade>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  bool _listIsInitialized = false;

  @override
  set list(Future<List<Grade>> value) {
    _$listAtom.reportWrite(value, _listIsInitialized ? super.list : null, () {
      super.list = value;
      _listIsInitialized = true;
    });
  }

  late final _$_GradeListBackActionController =
      ActionController(name: '_GradeListBack', context: context);

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_GradeListBackActionController.startAction(
        name: '_GradeListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_GradeListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
