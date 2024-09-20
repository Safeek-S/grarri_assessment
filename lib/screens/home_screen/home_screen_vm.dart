import 'package:flutter/material.dart';
import 'package:foodorderapp/screens/home_screen/home_screen_model.dart';
import 'package:mobx/mobx.dart';

import '../../models/menu_item_model.dart';
import '../cart_screen/cart_screen.dart';

class HomeScreenViewModel extends HomeScreenModel {
  void updateCartItems(List<MenuItem> updatedCartItems) {
    // Sort the cart items and updated items based on their IDs
    cartItems.sort((a, b) => a.id.compareTo(b.id));
    updatedCartItems.sort((a, b) => a.id.compareTo(b.id));

    int cartItemIndex = 0;
    int updateCartItemIndex = 0;

    // List to hold items to remove from cart
    List<MenuItem> itemsToRemove = [];

    // Iterate through the cart items
    while (cartItemIndex < cartItems.length) {
      if (updateCartItemIndex < updatedCartItems.length &&
          cartItems[cartItemIndex].id ==
              updatedCartItems[updateCartItemIndex].id) {
        // Use the setCountValue method to update the count if the item exists in the updated list
        cartItems[cartItemIndex]
            .setCountValue(updatedCartItems[updateCartItemIndex].count);
        updateCartItemIndex++;
      } else {
        // Add item to remove if not in updated list
        itemsToRemove.add(cartItems[cartItemIndex]);
      }
      cartItemIndex++;
    }

    // Remove items that are not in the updated list
    cartItems.removeWhere((item) => itemsToRemove.contains(item));

    // Debug print to check the final cart items
    cartItems.forEach((item) {
      print('${item.name} - ${item.count}');
    });
  }

  void onItemTapped(int index, context) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CartScreen(
                  items: cartItems,
                  previousOrders: previousOrders,
                )),
      ).then((dataFromPreviousScreen) {
        if (dataFromPreviousScreen[0] != null) {
          if (dataFromPreviousScreen[0] is List<MenuItem>) {
            if (dataFromPreviousScreen[0].isEmpty) {
              cartItems.clear();
            } else {
              updateCartItems(
                  dataFromPreviousScreen[0] as ObservableList<MenuItem>);
            }
          }
        }
        if (dataFromPreviousScreen[2] != null) {
          if (dataFromPreviousScreen[2] != -1) {
            changeIndex(dataFromPreviousScreen[2]);
          }
        }
        if (dataFromPreviousScreen[1] != null) {
          previousOrders =
              dataFromPreviousScreen[1] as ObservableList<MenuItem>;
        }
      });
    } else {
      changeIndex(index);
    }
  }

  void addItemToCart(MenuItem item) {
    item.count == 0 ? item.count++ : item.count;
    if (!cartItems.contains(item)) {
      cartItems.add(item);
    }
  }
}
