import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/models/menu_item_model.dart';
import 'package:foodorderapp/screens/menu_screen/widgets/menu_items_grid.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils.dart';

class SpecialMenuTabView extends StatefulWidget {
  final Function(MenuItem) addItemsToCart;
  const SpecialMenuTabView({super.key, required this.addItemsToCart});

  @override
  State<SpecialMenuTabView> createState() => _SpecialMenuTabViewState();
}

class _SpecialMenuTabViewState extends State<SpecialMenuTabView> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 17, horizontal: 17).w,
            width: 328.w,
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10).w,
              color: const Color(0xffF1F1F1),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffD9D9D9E5),
                  offset: Offset(5, 5),
                  blurRadius: 13,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0xFFFFFFFFE5),
                  offset: Offset(-5, -5),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Opacity(
              opacity: 0.3,
              child: Container(
                padding: const EdgeInsets.all(4).w,
                width: 320.w,
                height: 122.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).w,
                  gradient: RadialGradient(
                    center: Alignment.centerLeft,
                    radius: 1.0,
                    colors: [
                      const Color(0xFF000000).withOpacity(1.0),
                      const Color(0xFF000000).withOpacity(0.32),
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 12).w,
                    child: SizedBox(
                      width: 150.w,
                      child: Text(
                        "Welcome to Sunrise Cafe",
                        style: GoogleFonts.ubuntu(
                            color: const Color(0xffFFFFFF),
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: AppStyle.mediumFont)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                    "Today's Special",
                    style: GoogleFonts.ubuntu(
                        color: const Color(0xff4A5662),
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: AppStyle.mediumFont)),
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
                MenuItemsGrid(
                  addItemsToCart: widget.addItemsToCart,
                  items: menuItems.where((item) => item.isSpecial).toList(),
                ),
              ],
            ),
          ),
          50.verticalSpace,
        ],
      ),
    );
  }
}
