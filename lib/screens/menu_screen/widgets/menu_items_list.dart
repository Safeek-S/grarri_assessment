import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/widgets/add_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_item_model.dart';
import '../../../utils.dart';

class MenuItemsList extends StatelessWidget {
  final Function(MenuItem) addItemsToCart;
  final List<MenuItem> menuItems;
  const MenuItemsList(
      {super.key, required this.menuItems, required this.addItemsToCart});

  @override
  Widget build(BuildContext context) {
    return menuItems.isEmpty
        ? Center(
            child: Text(
              "No items available",
              style: GoogleFonts.ubuntu(
                color: const Color(0xff4A5662),
                textStyle: TextStyle(
                    fontSize: 16.sp, fontWeight: AppStyle.semiBoldFont),
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15).w,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return Container(
                height: 87.h,
                width: 328.w,
                margin: const EdgeInsets.all(8).w,
                padding: const EdgeInsets.all(8).w,
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(8.0).w,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFDCDCDC).withOpacity(0.9),
                      offset: const Offset(2, 2),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFFFFFFFF).withOpacity(0.9),
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFFDCDCDC).withOpacity(0.2),
                      offset: const Offset(2, -2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFFDCDCDC).withOpacity(0.2),
                      offset: const Offset(-2, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      menuItems[index].imagePath,
                      width: 71.w,
                      height: 71.h,
                      fit: BoxFit.fill,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8).w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menuItems[index].name,
                              overflow: TextOverflow.visible,
                              maxLines: 3,
                              style: GoogleFonts.ubuntu(
                                color: const Color(0xff4A5662),
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: AppStyle.mediumFont),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'lib/assets/images/veg.png',
                                  width: 16.w,
                                  height: 16.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8).w,
                                  child: Text(
                                    '\u{20B9}299',
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: AppStyle.mediumFont),
                                      color: const Color(0xff4A5662),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 1.5,
                      ).w,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: AddButton(
                          addItemsToCart: addItemsToCart,
                          menuItem: menuItems[index],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
