import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/cart_screen/cart_screen.dart';
import 'package:foodorderapp/screens/empty_screen/empty_screen.dart';
import 'package:foodorderapp/screens/home_screen/home_screen_vm.dart';
import 'package:foodorderapp/screens/menu_screen/menu_screen.dart';
import 'package:foodorderapp/screens/widgets/box_decoration_wrapper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/menu_item_model.dart';

class HomeScreen extends StatelessWidget {
  final List<MenuItem> menuItems;
   HomeScreen({super.key, required this.menuItems});

  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const EmptyScreen(),
      MenuScreen(
        addItemToCart: homeScreenViewModel.addItemToCart,
        menuItems: menuItems,
      ),
      CartScreen(
        items: const [],
        previousOrders: const [],
      ),
    ];
    return Observer(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Color(0xffF1F1F1),
            ),
            child: SizedBox(
              height: 60.h,
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.all(6).w,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(10).w,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffDEDEDE).withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 13,
                            offset: const Offset(5, 5),
                          ),
                          BoxShadow(
                            color: const Color(0xffFFFFFF).withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(-5, -5),
                          ),
                          BoxShadow(
                            color: const Color(0xffDEDEDE).withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(5, -5),
                          ),
                          BoxShadow(
                            color: const Color(0xffDEDEDE).withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(-5, 5),
                          ),
                        ],
                      ),
                      child: Image.asset('lib/assets/images/bolt.png',
                          width: 20.w, height: 20.h),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: ContainerWrapper(
                      padding: const EdgeInsets.all(6).w,
                      borderRadius: BorderRadius.circular(10).w,
                      color: const Color(0xffF1F1F1),
                      boxShadowValues: [
                        {
                          "color": const Color(0xffDEDEDE).withOpacity(0.9),
                          "blurRadius": 13.0,
                          "offset": const Offset(5, 5),
                          "inset": true
                        },
                        {
                          "color": const Color(0xffFFFFFF).withOpacity(0.9),
                          "blurRadius": 10.0,
                          "offset": const Offset(-5, -5),
                          "inset": true
                        },
                        {
                          "color": const Color(0xffDEDEDE).withOpacity(0.2),
                          "blurRadius": 10.0,
                          "offset": const Offset(5, -5),
                          "inset": true
                        },
                        {
                          "color": const Color(0xffDEDEDE).withOpacity(0.2),
                          "blurRadius": 10.0,
                          "offset": const Offset(-5, 5),
                          "inset": true,
                        }
                      ],
                      childWidget: Image.asset('lib/assets/images/book.png',
                          width: 20.w, height: 20.h),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6).w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10).w,
                            color: const Color(0xffF1F1F1),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffDEDEDE).withOpacity(0.9),
                                spreadRadius: 0,
                                blurRadius: 13,
                                offset: const Offset(5, 5),
                              ),
                              BoxShadow(
                                color: const Color(0xffFFFFFF).withOpacity(0.9),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(-5, -5),
                              ),
                              BoxShadow(
                                color: const Color(0xffDEDEDE).withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(5, -5),
                              ),
                              BoxShadow(
                                color: const Color(0xffDEDEDE).withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(-5, 5),
                              ),
                            ],
                          ),
                          child: Image.asset('lib/assets/images/cart.png',
                              width: 20.w, height: 20.h),
                        ),
                        if (homeScreenViewModel.cartItems.isNotEmpty)
                          Positioned(
                            right: -15,
                            top: -8,
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffEF4B4B),
                              ),
                              child: Text(
                                homeScreenViewModel.cartItems.length.toString(),
                                style: GoogleFonts.ubuntu(
                                  color: const Color(0xffFFFFFF),
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
                currentIndex: homeScreenViewModel.selectedIndex,
                onTap:(index) =>  homeScreenViewModel.onItemTapped(index,context),
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
              ),
            ),
          ),
          backgroundColor: const Color(0xffF1F1F1),
          body: SafeArea(
            child: IndexedStack(
              index: homeScreenViewModel.selectedIndex,
              children: screens,
            ),
          ),
        );
      }
    );
  }
}
