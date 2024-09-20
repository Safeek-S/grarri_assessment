// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuItem on _MenuItem, Store {
  late final _$countAtom = Atom(name: '_MenuItem.count', context: context);

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$_MenuItemActionController =
      ActionController(name: '_MenuItem', context: context);

  @override
  void setCountValue(int count) {
    final _$actionInfo = _$_MenuItemActionController.startAction(
        name: '_MenuItem.setCountValue');
    try {
      return super.setCountValue(count);
    } finally {
      _$_MenuItemActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
