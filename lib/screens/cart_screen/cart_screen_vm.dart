import 'package:flutter/material.dart';
import 'package:foodorderapp/screens/cart_screen/cart_screen_model.dart';
import 'package:mobx/mobx.dart';

import '../../models/menu_item_model.dart';

class CartScreenViewModel extends CartScreenModel {
  void setInitialValuesOfCartAndPreviousOrder(
      List<MenuItem> items, List<MenuItem> previousOrdersItems) {
         cartItems.clear();
  previousOrders.clear();
     cartItems.addAll(items);
  previousOrders.addAll(previousOrdersItems);
 
  }

  String itemsText(int length) {
    if (length > 1) {
      return '$length Items';
    } else {
      return '$length Item';
    }
  }

  void addToCart(MenuItem item) {
    var matchedItem =
        cartItems.firstWhere((cartItem) => cartItem.name == item.name);
    matchedItem.count++;
  }

  void removeFromCart(MenuItem item) {
    if (item.count > 0) {
      item.count--;
      if (item.count == 0) {
        cartItems.remove(item);
      }
    }
  }

  void placeOrder(context) {
    var copiedItems = cartItems.map((item) => item.copyWith()).toList();
    previousOrders.addAll(copiedItems);
    cartItems.clear();
    Navigator.pop(context, [cartItems, previousOrders, 1]);
  }
}
