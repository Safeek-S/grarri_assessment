import 'package:flutter/material.dart';

import 'models/menu_item_model.dart';

class AppStyle {
  static const boldFont = FontWeight.w700,
      semiBoldFont = FontWeight.w600,
      normalFont = FontWeight.w400,
      mediumFont = FontWeight.w500;
}

class AppConstants {
  static const acaiBowl = "lib/assets/images/acai_bowl.png",
      sunsetAcaiBowl = "lib/assets/images/sunset_acai_bowl.png",
      chocolateBowl = "lib/assets/images/chocolate_bowl.png";
}

List<MenuItem> menuItems = [
  MenuItem(
      id: 1, // Unique ID
      name: 'Avocado Toast',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 2, // Unique ID
      name: 'Triple Chocolate Brownie',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.chocolateBowl,
      isSpecial: true),
  MenuItem(
      id: 3, // Unique ID
      name: 'Grilled Chicken Salad',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl),
  MenuItem(
      id: 4, // Unique ID
      name: 'Classic Cheeseburger',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl,
      isSpecial: true),
  MenuItem(
      id: 5, // Unique ID
      name: 'Berry Smoothie Bowl',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 6, // Unique ID
      name: 'Mango Sorbet',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.chocolateBowl,
      isSpecial: true),
  MenuItem(
      id: 7, // Unique ID
      name: 'Quinoa Salad',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl),
  MenuItem(
      id: 8, // Unique ID
      name: 'Veggie Wrap',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 9, // Unique ID
      name: 'Banana Bread',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.chocolateBowl,
      isSpecial: true),
  MenuItem(
      id: 10, // Unique ID
      name: 'Caesar Salad',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl),
  MenuItem(
      id: 11, // Unique ID
      name: 'Fruit Parfait',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 12, // Unique ID
      name: 'Mushroom Risotto',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.chocolateBowl,
      isSpecial: true),
  MenuItem(
      id: 13, // Unique ID
      name: 'Blueberry Pancakes',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl),
  MenuItem(
      id: 14, // Unique ID
      name: 'Grilled Salmon',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 15, // Unique ID
      name: 'Chocolate Lava Cake',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.chocolateBowl,
      isSpecial: true),
  MenuItem(
      id: 16, // Unique ID
      name: 'Vegan Burrito Bowl',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl),
  MenuItem(
      id: 17, // Unique ID
      name: 'Apple Crumble',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 18, // Unique ID
      name: 'Spaghetti Bolognese',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.chocolateBowl),
  MenuItem(
      id: 19, // Unique ID
      name: 'Chocolate Chip Cookies',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl,
      isSpecial: true),
  MenuItem(
      id: 20, // Unique ID
      name: 'Falafel Plate',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 21, // Unique ID
      name: 'Tiramisu',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.chocolateBowl,
      isSpecial: true),
  MenuItem(
      id: 22, // Unique ID
      name: 'Chicken Quesadilla',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl),
  MenuItem(
      id: 23, // Unique ID
      name: 'Lemon Tart',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 24, // Unique ID
      name: 'Tomato Basil Soup',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.chocolateBowl),
  MenuItem(
      id: 25, // Unique ID
      name: 'Peach Cobbler',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.sunsetAcaiBowl,
      isSpecial: true),
  MenuItem(
      id: 26, // Unique ID
      name: 'Beef Tacos',
      category: 'Main',
      count: 0,
      imagePath: AppConstants.acaiBowl),
  MenuItem(
      id: 27, // Unique ID
      name: 'Chocolate Eclairs',
      category: 'Desserts',
      count: 0,
      imagePath: AppConstants.chocolateBowl,
      isSpecial: true),
];
