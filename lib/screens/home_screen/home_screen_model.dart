import 'package:mobx/mobx.dart';

import '../../models/menu_item_model.dart';
part 'home_screen_model.g.dart';

class HomeScreenModel extends _HomeScreenModel with _$HomeScreenModel {}

abstract class _HomeScreenModel with Store {
  ObservableList<MenuItem> cartItems = ObservableList<MenuItem>();
  ObservableList<MenuItem> previousOrders = ObservableList<MenuItem>();

  @observable
  int selectedIndex = 1;

  @action
  void changeIndex(int index) {
    selectedIndex = index;
  }
}
