
import 'package:mobx/mobx.dart';

part 'orders_widget_model.g.dart'; // Make sure to generate this file using build_runner

class OrdersWidgetModel = _OrdersWidgetModel with _$OrdersWidgetModel;

abstract class _OrdersWidgetModel with Store {

  @observable
  bool isExoanded = false;


 


  @action 
  void toggleExpanded(bool value){
    isExoanded = value;
  }
}
