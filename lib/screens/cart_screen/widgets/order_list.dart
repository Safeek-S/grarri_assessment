import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/widgets/button_wrapper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_item_model.dart';
import '../../../utils.dart';
import '../../widgets/rounded_button.dart';

class OrderList extends StatefulWidget {
  final bool isPreviousOrders;
  final Function(MenuItem)? addToCart;
  final Function(MenuItem)? removeFromCart;
  final List<MenuItem> items;
  const OrderList(
      {super.key,
      required this.items,
      required this.addToCart,
      required this.removeFromCart,
      required this.isPreviousOrders});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return widget.items.isEmpty
        ? const SizedBox.shrink()
        : Container(
            padding: const EdgeInsets.only(left: 16, top: 16).w,
            width: 344.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10).w,
              color: const Color(0xffF1F1F1),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 5,
                  color: const Color(0xffAEAEC0).withOpacity(0.4),
                ),
                const BoxShadow(
                  offset: Offset(-3, -3),
                  blurRadius: 7,
                  color: Color(0xffFFFFFF),
                ),
              ],
            ),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.items.length,
                  padding:
                      const EdgeInsets.only(left: 8, right: 8, bottom: 15).w,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      height: 50.h,
                      width: 344.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'lib/assets/images/veg.png',
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8).w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
                                        widget.items[index].name,
                                        overflow: TextOverflow.visible,
                                        maxLines: 3,
                                        style: GoogleFonts.ubuntu(
                                          color: const Color(0xff4A5662),
                                          textStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: AppStyle.normalFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2).w,
                                      child: Text(
                                        '\u{20B9}299',
                                        style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: AppStyle.mediumFont,
                                          ),
                                          color: const Color(0xff727272),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          widget.isPreviousOrders
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 30.0).w,
                                  child: Text(
                                    widget.items[index].count.toString(),
                                    style: GoogleFonts.ubuntu(
                                      color: const Color(0xff4A5662),
                                      textStyle: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: AppStyle.mediumFont,
                                      ),
                                    ),
                                  ),
                                )
                              : ButtonWrapper(
                                  buttonWidgetPadding: const EdgeInsets.only(
                                          left: 4, right: 8, top: 5, bottom: 5)
                                      .w,
                                  width: 90.w,
                                  height: 32.h,
                                  buttonWidget: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          onTap: () => widget.removeFromCart!(
                                                widget.items[index],
                                              ),
                                          child: const RoundedButton(
                                              icon: Icons.remove)),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0)
                                                  .w,
                                          child: Text(
                                            widget.items[index].count
                                                .toString(),
                                            style: GoogleFonts.ubuntu(
                                              color: const Color(0xff4A5662),
                                              textStyle: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: AppStyle.mediumFont,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => widget.addToCart!(
                                          widget.items[index],
                                        ),
                                        child: const RoundedButton(
                                          icon: Icons.add,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16).w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Add cooking instruction',
                      style: GoogleFonts.ubuntu(
                        color: const Color(0xff76DFE5),
                        textStyle: TextStyle(
                            fontSize: 12.sp, fontWeight: AppStyle.mediumFont),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
