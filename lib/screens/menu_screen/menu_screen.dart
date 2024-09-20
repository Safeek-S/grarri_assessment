import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/menu_item_model.dart';
import '../../utils.dart';
import 'widgets/category_based_menu_view.dart';
import 'widgets/special_menu_tab_view.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> menuItems;
  final Function(MenuItem) addItemToCart;
  const MenuScreen(
      {super.key, required this.addItemToCart, required this.menuItems});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: 360.w,
                height: 110.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).w,
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffAEAEC0),
                      offset: Offset(1.5, 1.5),
                      blurRadius: 3,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      offset: Offset(-1, -1),
                      blurRadius: 3,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 28.w,
                              height: 28.h,
                              decoration: const BoxDecoration(
                                  color: Color(0xffA9ACAA),
                                  shape: BoxShape.circle),
                            ),
                            6.horizontalSpace,
                            Expanded(
                              child: Text(
                                "Sunrise Cafe",
                                style: GoogleFonts.ubuntu(
                                  color: const Color(0xff4A5662),
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: AppStyle.boldFont),
                                ),
                              ),
                            ),
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xffF1F1F1),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffAEAEC0)
                                        .withOpacity(0.4),
                                    offset: const Offset(1.5, 1.5),
                                    blurRadius: 3,
                                  ),
                                  const BoxShadow(
                                    color: Color(0xFFFFFFFF),
                                    offset: Offset(-1, -1),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.record_voice_over,
                                size: 13.84.h,
                                color: const Color(0xff4A5662),
                              ),
                            ),
                            16.horizontalSpace,
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xffF1F1F1),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffAEAEC0)
                                        .withOpacity(0.4),
                                    offset: const Offset(1.5, 1.5),
                                    blurRadius: 3,
                                  ),
                                  const BoxShadow(
                                    color: Color(0xFFFFFFFF),
                                    offset: Offset(-1, -1),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.tag,
                                size: 13.84.h,
                                color: const Color(0xff4A5662),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    TabBar(
                      labelStyle: GoogleFonts.poppins(
                        color: const Color(0xff4A5662),
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: AppStyle.semiBoldFont),
                      ),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      dividerColor: Colors.transparent,
                      labelColor: const Color(0xff3CBCB4),
                      unselectedLabelColor: const Color(0xff4A5662),
                      indicatorColor: const Color(0xff3CBCB4),
                      tabs: const [
                        Tab(text: 'Special'),
                        Tab(text: 'Main'),
                        Tab(text: 'Desserts'),
                        Tab(text: 'Beverages'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10).w,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: TabBarView(
                    children: [
                      SpecialMenuTabView(
                        addItemsToCart: widget.addItemToCart,
                        menuItems: widget.menuItems,
                      ),
                      CategoryBasedMenuView(
                        title: 'Acai Bowl',
                        menuItems: widget.menuItems
                            .where((item) => item.category == "Main")
                            .toList(),
                        addItemsToCart: widget.addItemToCart,
                      ),
                      CategoryBasedMenuView(
                        title: 'Acai Bowl',
                        menuItems: widget.menuItems
                            .where((item) => item.category == "Desserts")
                            .toList(),
                        addItemsToCart: widget.addItemToCart,
                      ),
                      CategoryBasedMenuView(
                        title: '',
                        menuItems: widget.menuItems
                            .where((item) => item.category == "Beverages")
                            .toList(),
                        addItemsToCart: widget.addItemToCart,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
