import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/menu_screen/widgets/menu_items_list.dart';
import 'package:foodorderapp/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_item_model.dart';

class CategoryBasedMenuView extends StatefulWidget {
  final Function(MenuItem) addItemsToCart;
  final String title;
  final List<MenuItem> menuItems;
  const CategoryBasedMenuView(
      {super.key,
      required this.title,
      required this.menuItems,
      required this.addItemsToCart});

  @override
  State<CategoryBasedMenuView> createState() => _CategoryBasedMenuViewState();
}

class _CategoryBasedMenuViewState extends State<CategoryBasedMenuView> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.title.isEmpty && widget.menuItems.isEmpty
          ? Align(
              alignment: Alignment.center,
              child: Text(
                "No items available",
                style: GoogleFonts.ubuntu(
                  color: const Color(0xff4A5662),
                  textStyle: TextStyle(
                      fontSize: 16.sp, fontWeight: AppStyle.semiBoldFont),
                ),
              ),
            )
          : Column(
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: isExpanded,
                    onExpansionChanged: (value) {
                      setState(() {
                        isExpanded = value;
                      });
                    },
                    trailing: isExpanded
                        ? Icon(
                            Icons.arrow_drop_up,
                            size: 20.w,
                            color: const Color(0xff3CBCB4),
                          )
                        : Icon(
                            Icons.arrow_drop_down,
                            size: 20.w,
                            color: const Color(0xff3CBCB4),
                          ),
                    title: Row(
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.ubuntu(
                              color: const Color(0xff4A5662),
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: AppStyle.mediumFont)),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Color(0xff4A5662),
                          ),
                        ),
                      ],
                    ),
                    children: [
                      MenuItemsList(
                        menuItems: widget.menuItems,
                        addItemsToCart: widget.addItemsToCart,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
