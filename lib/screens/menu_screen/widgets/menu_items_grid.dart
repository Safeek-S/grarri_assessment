import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_item_model.dart';
import 'special_menu_list_tile.dart';

class MenuItemsGrid extends StatelessWidget {
  final Function(MenuItem) addItemsToCart;
  final List<MenuItem> items;
  const MenuItemsGrid(
      {super.key, required this.items, required this.addItemsToCart});

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Center(
            child: Text(
              "No items available",
              style: GoogleFonts.ubuntu(
                color: Color(0xff4A5662),
                textStyle: TextStyle(
                    fontSize: 16.sp, fontWeight: AppStyle.semiBoldFont),
              ),
            ),
          )
        : SizedBox(
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15).w,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0.w,
                crossAxisSpacing: 8.0.w,
              ),
              itemCount: items.where((item) => item.isSpecial).toList().length,
              itemBuilder: (context, index) {
                return SpecialMenuListTile(
                  callBack: addItemsToCart,
                  menuItem: items[index],
                );
              },
            ),
          );
  }
}
