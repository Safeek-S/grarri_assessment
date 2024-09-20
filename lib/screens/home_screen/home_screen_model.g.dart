// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModel, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_HomeScreenModel.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_HomeScreenModelActionController =
      ActionController(name: '_HomeScreenModel', context: context);

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_HomeScreenModelActionController.startAction(
        name: '_HomeScreenModel.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_HomeScreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
