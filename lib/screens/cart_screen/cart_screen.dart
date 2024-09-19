import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/cart_screen/widgets/orders_widget.dart';
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
  String itemsText(int length) {
    if (length > 1) {
      return '${length} Items';
    } else {
      return '${length} Item';
    }
  }

  void addToCart(MenuItem item) {
    setState(() {
      var matchedItem =
          widget.items.firstWhere((cartItem) => cartItem.name == item.name);
      matchedItem.count++;
    });
  }

  void removeFromCart(MenuItem item) {
    setState(() {
      if (item.count > 0) {
        item.count--;
        if (item.count == 0) {
          widget.items.remove(item);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: widget.items.isEmpty
          ? const SizedBox.shrink()
          : Container(
              width: 344.w,
              height: 44.h,
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16).w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).w,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff459EAF),
                    Color(0xff007991),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16).w,
                    child: Text(
                      itemsText(widget.items.length),
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
                                fontSize: 13.sp, fontWeight: AppStyle.boldFont),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        var copiedItems = widget.items
                            .map((item) => item.copyWith())
                            .toList();
                        widget.previousOrders.addAll(copiedItems);
                        widget.items.clear();
                      });

                      Navigator.pop(
                          context, [widget.items, widget.previousOrders, 1]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8).w,
                      width: 28.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 2),
                              blurRadius: 5,
                              color: const Color(0xff1C6F80).withOpacity(0.9)),
                          BoxShadow(
                              offset: const Offset(-2, -2),
                              blurRadius: 4,
                              color: const Color(0xff2AA7C0).withOpacity(0.9)),
                        ],
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff459EAF),
                            Color(0xff007991),
                          ],
                        ),
                      ),
                      child: const Icon(
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
                  color: const Color(
                      0xffF1F1F1), 
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xAEAEC0)
                          .withOpacity(0.4), 
                      offset: const Offset(
                          1.5, 1.5), 
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
                          Navigator.pop(context,
                              [widget.items, widget.previousOrders, -1]);
                        },
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).w,
                              color: const Color(0xffF1F1F1),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(5, 5),
                                    blurRadius: 13,
                                    color: const Color(0xffE6E6E6)
                                        .withOpacity(0.9)),
                                BoxShadow(
                                  offset: const Offset(-5, -5),
                                  blurRadius: 10,
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.9),
                                ),
                                BoxShadow(
                                  offset: const Offset(5, -5),
                                  blurRadius: 10,
                                  color:
                                      const Color(0xffE6E6E6).withOpacity(0.2),
                                ),
                                BoxShadow(
                                  offset: const Offset(-5, 5),
                                  blurRadius: 10,
                                  color:
                                      const Color(0xffE6E6E6).withOpacity(0.2),
                                ),
                                BoxShadow(
                                  offset: const Offset(-1, -1),
                                  blurRadius: 2,
                                  color:
                                      const Color(0xffE6E6E6).withOpacity(0.5),
                                ),
                                BoxShadow(
                                  offset: const Offset(1, 1),
                                  blurRadius: 2,
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.3),
                                ),
                              ]),
                          child: Icon(
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
                      Container(
                        child: Icon(
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
                items: widget.items,
                isExpanded: true,
                addToCart: addToCart,
                removeFromCart: removeFromCart,
              ),
              OrdersWidget(
                isPreviousOrders: true,
                expansionTileTitle: 'Previous orders',
                items: widget.previousOrders,
                isExpanded: true,
                addToCart: null,
                removeFromCart: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
