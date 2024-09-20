import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/cart_screen/cart_screen_vm.dart';
import 'package:foodorderapp/screens/cart_screen/widgets/orders_widget.dart';
import 'package:foodorderapp/screens/widgets/box_decoration_wrapper.dart';
import 'package:foodorderapp/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/menu_item_model.dart';

class CartScreen extends StatefulWidget {
  final List<MenuItem> items;
  List<MenuItem> previousOrders;
  CartScreen({super.key, required this.items, required this.previousOrders});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartScreenViewModel cartScreenViewModel = CartScreenViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartScreenViewModel.setInitialValuesOfCartAndPreviousOrder(
        widget.items,
        widget.previousOrders,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        bottomSheet: cartScreenViewModel.cartItems.isEmpty
            ? const SizedBox.shrink()
            : ContainerWrapper(
                width: 344.w,
                height: 44.h,
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16).w,
                borderRadius: BorderRadius.circular(10).w,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff459EAF),
                    Color(0xff007991),
                  ],
                ),
                childWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16).w,
                      child: Text(
                        cartScreenViewModel
                            .itemsText(cartScreenViewModel.cartItems.length),
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xffFFFFFF),
                          textStyle: TextStyle(
                              fontSize: 12.sp, fontWeight: AppStyle.mediumFont),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8).w,
                          child: Text(
                            'PLACE ORDER',
                            style: GoogleFonts.ubuntu(
                              color: const Color(0xffFFFFFF),
                              textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: AppStyle.boldFont),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cartScreenViewModel.placeOrder(context),
                      child: ContainerWrapper(
                        margin: const EdgeInsets.only(right: 8).w,
                        padding: const EdgeInsets.all(6).w,
                        boxShadowValues: [
                          {
                            "offset": const Offset(2, 2),
                            "blurRadius": 5.0,
                            "color": const Color(0xff1C6F80).withOpacity(0.9),
                            "inset": true,
                          },
                          {
                            "offset": const Offset(-2, -2),
                            "blurRadius": 4.0,
                            "color": const Color(0xff2AA7C0).withOpacity(0.9),
                            "inset": true,
                          },
                          {
                            "offset": const Offset(2, -2),
                            "blurRadius": 4.0,
                            "color": const Color(0xff1C6F80).withOpacity(0.2),
                            "inset": true,
                          },
                          {
                            "offset": const Offset(-2, 2),
                            "blurRadius": 4.0,
                            "color": const Color(0xff1C6F80).withOpacity(0.2),
                            "inset": true,
                          },
                        ],
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff459EAF),
                            Color(0xff007991),
                          ],
                        ),
                        childWidget: const Icon(
                          Icons.arrow_forward,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 360.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ).w,
                    color: const Color(0xffF1F1F1),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xAEAEC0).withOpacity(0.4),
                        offset: const Offset(1.5, 1.5),
                        blurRadius: 3,
                        spreadRadius: 0,
                      ),
                      const BoxShadow(
                        color: Color(0xFFFFFFFF),
                        offset: Offset(-1, -1),
                        blurRadius: 3,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 16).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, [
                              cartScreenViewModel.cartItems,
                              cartScreenViewModel.previousOrders,
                              -1
                            ]);
                          },
                          child: ContainerWrapper(
                            width: 32.w,
                            height: 32.h,
                            borderRadius: BorderRadius.circular(10).w,
                            color: const Color(0xffF1F1F1),
                            boxShadowValues: [
                              {
                                "offset": const Offset(5, 5),
                                "blurRadius": 13.0,
                                "color":
                                    const Color(0xffE6E6E6).withOpacity(0.9)
                              },
                              {
                                "offset": const Offset(-5, -5),
                                "blurRadius": 10.0,
                                "color":
                                    const Color(0xffFFFFFF).withOpacity(0.9),
                              },
                              {
                                "offset": const Offset(5, -5),
                                "blurRadius": 10.0,
                                "color":
                                    const Color(0xffE6E6E6).withOpacity(0.2),
                              },
                              {
                                "offset": const Offset(-5, 5),
                                "blurRadius": 10.0,
                                "color":
                                    const Color(0xffE6E6E6).withOpacity(0.2),
                              },
                              {
                                "offset": const Offset(-1, -1),
                                "blurRadius": 2.0,
                                "color":
                                    const Color(0xffE6E6E6).withOpacity(0.5),
                                "inset": true,
                              },
                              {
                                "offset": const Offset(1, 1),
                                "blurRadius": 2.0,
                                "color":
                                    const Color(0xffFFFFFF).withOpacity(0.3),
                                "inset": true,
                              },
                            ],
                            childWidget: Icon(
                              Icons.arrow_back,
                              size: 20.h,
                              color: const Color(0xff4A5662),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16).w,
                            child: Text(
                              "Place Order",
                              style: GoogleFonts.ubuntu(
                                color: const Color(0xff4A5662),
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: AppStyle.mediumFont),
                              ),
                            ),
                          ),
                        ),
                        ContainerWrapper(
                          width: 32.w,
                          height: 32.h,
                          borderRadius: BorderRadius.circular(10).w,
                          color: const Color(0xffF1F1F1),
                          boxShadowValues: [
                            {
                              "offset": const Offset(5, 5),
                              "blurRadius": 13.0,
                              "color": const Color(0xffDEDEDE).withOpacity(0.9)
                            },
                            {
                              "offset": const Offset(-5, -5),
                              "blurRadius": 10.0,
                              "color": const Color(0xffFFFFFF).withOpacity(0.9),
                            },
                            {
                              "offset": const Offset(5, -5),
                              "blurRadius": 10.0,
                              "color": const Color(0xffDEDEDE).withOpacity(0.2),
                            },
                            {
                              "offset": const Offset(-5, 5),
                              "blurRadius": 10.0,
                              "color": const Color(0xffDEDEDE).withOpacity(0.2),
                            },
                          ],
                          childWidget: Icon(
                            Icons.feedback,
                            size: 20.h,
                            color: const Color(0xffF4B740),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                OrdersWidget(
                  isPreviousOrders: false,
                  expansionTileTitle: 'Current order',
                  items: cartScreenViewModel.cartItems,
                  addToCart: cartScreenViewModel.addToCart,
                  removeFromCart: cartScreenViewModel.removeFromCart,
                ),
                OrdersWidget(
                  isPreviousOrders: true,
                  expansionTileTitle: 'Previous orders',
                  items: cartScreenViewModel.previousOrders,
                  addToCart: null,
                  removeFromCart: null,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
