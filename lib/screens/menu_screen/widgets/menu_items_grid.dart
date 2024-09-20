import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_item_model.dart';
import 'special_menu_list_tile.dart';

class MenuItemsGrid extends StatelessWidget {
  final Function(MenuItem) addItemsToCart;
  final List<MenuItem> items;

  const MenuItemsGrid({
    super.key,
    required this.items,
    required this.addItemsToCart,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          "No items available",
          style: GoogleFonts.ubuntu(
            color: Color(0xff4A5662),
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: AppStyle.semiBoldFont,
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
        child: Wrap(
          spacing: 8.0.w, // Space between items
          runSpacing: 16.0.w, // Space between rows
          children: items.where((item) => item.isSpecial).map((item) {
            return SpecialMenuListTile(
              callBack: addItemsToCart,
              menuItem: item,
            );
          }).toList(),
        ),
      ),
    );
  }
}
