// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageBack on _HomePageBack, Store {
  late final _$listAtom = Atom(name: '_HomePageBack.list', context: context);

  @override
  ObservableFuture<List<Grades>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableFuture<List<Grades>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_HomePageBackActionController =
      ActionController(name: '_HomePageBack', context: context);

  @override
  void refreshlist() {
    final _$actionInfo = _$_HomePageBackActionController.startAction(
        name: '_HomePageBack.refreshlist');
    try {
      return super.refreshlist();
    } finally {
      _$_HomePageBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
