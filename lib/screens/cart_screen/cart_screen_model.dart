import 'package:mobx/mobx.dart';

import '../../models/menu_item_model.dart';
part 'cart_screen_model.g.dart';
class CartScreenModel extends _CartScreenModel with _$CartScreenModel {}

abstract class _CartScreenModel with Store {
  ObservableList<MenuItem> cartItems = ObservableList<MenuItem>();
  ObservableList<MenuItem> previousOrders = ObservableList<MenuItem>();
}
