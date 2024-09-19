import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/cart_screen/cart_screen.dart';
import 'package:foodorderapp/screens/empty_screen/empty_screen.dart';
import 'package:foodorderapp/screens/menu_screen/menu_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/menu_item_model.dart';

class HomeScreen extends StatefulWidget {
  final List<MenuItem> menuItems;
  const HomeScreen({super.key, required this.menuItems});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MenuItem> cartItems = [];
  List<MenuItem> previousOrders = [];
  int _selectedIndex = 1;
  void updateCartItems(List<MenuItem> updatedCartItems) {
    cartItems.sort((a, b) => a.id.compareTo(b.id));
    updatedCartItems.sort((a, b) => a.id.compareTo(b.id));

    int i = 0;
    int j = 0;

    while (i < cartItems.length) {
      if (j < updatedCartItems.length &&
          cartItems[i].id == updatedCartItems[j].id) {
        cartItems[i].count = updatedCartItems[j].count;
        j++;
      } else {
        cartItems[i].count = 0;
      }
      i++;
    }
    setState(() {
      cartItems;
    });
    cartItems.forEach((item) {
      print("Name: ${item.name} - ${item.count}");
    });
  }

  void _onItemTapped(int index) {
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
              updateCartItems(dataFromPreviousScreen[0]);
            }
          }
        }
        if (dataFromPreviousScreen[2] != null) {
          setState(() {
            if (dataFromPreviousScreen[2] != -1) {
              _selectedIndex = dataFromPreviousScreen[2];
            }
          });
        }
        if (dataFromPreviousScreen[1] != null) {
          setState(() {
            previousOrders = dataFromPreviousScreen[1];
          });
        }
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void addItemToCart(MenuItem item) {
    item.count == 0 ? item.count++ : item.count;
    if (!cartItems.contains(item)) {
      cartItems.add(item);
    }
    setState(() {
      cartItems;
    });
    print(cartItems.length);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const EmptyScreen(),
      MenuScreen(addItemToCart: addItemToCart, menuItems: widget.menuItems,),
      CartScreen(
        items: const [],
        previousOrders: const [],
      ),
    ];
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
                  padding: const EdgeInsets.all(5).w,
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
                icon: Container(
                  padding: const EdgeInsets.all(5).w,
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
                  child: Image.asset('lib/assets/images/book.png',
                      width: 20.w, height: 20.h),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5).w,
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
                    if (cartItems.isNotEmpty)
                      Positioned(
                        right: -15,
                        top: -8,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Text(
                            cartItems.length.toString(),
                            style: GoogleFonts.ubuntu(
                              color: Colors.white,
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
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
      backgroundColor: const Color(0xffF1F1F1),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
      ),
    );
  }
}
