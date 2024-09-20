// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_widget_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersWidgetModel on _OrdersWidgetModel, Store {
  late final _$isExoandedAtom =
      Atom(name: '_OrdersWidgetModel.isExoanded', context: context);

  @override
  bool get isExoanded {
    _$isExoandedAtom.reportRead();
    return super.isExoanded;
  }

  @override
  set isExoanded(bool value) {
    _$isExoandedAtom.reportWrite(value, super.isExoanded, () {
      super.isExoanded = value;
    });
  }

  late final _$_OrdersWidgetModelActionController =
      ActionController(name: '_OrdersWidgetModel', context: context);

  @override
  void toggleExpanded(bool value) {
    final _$actionInfo = _$_OrdersWidgetModelActionController.startAction(
        name: '_OrdersWidgetModel.toggleExpanded');
    try {
      return super.toggleExpanded(value);
    } finally {
      _$_OrdersWidgetModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isExoanded: ${isExoanded}
    ''';
  }
}
