import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/cart_screen/widgets/order_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/menu_item_model.dart';
import '../../../utils.dart';

class OrdersWidget extends StatefulWidget {
  final bool isPreviousOrders;
  final Function(MenuItem)? addToCart;
  final Function(MenuItem)? removeFromCart;
  bool isExpanded;
  final String expansionTileTitle;
  final List<MenuItem> items;
  OrdersWidget(
      {super.key,
      required this.expansionTileTitle,
      required this.items,
      required this.isExpanded,
      required this.addToCart,
      required this.removeFromCart, required this.isPreviousOrders});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: widget.isExpanded,
              onExpansionChanged: (value) {
                setState(() {
                  widget.isExpanded = value;
                });
              },
              trailing: widget.isExpanded
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
                    widget.expansionTileTitle,
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
                OrderList(
                  isPreviousOrders:widget.isPreviousOrders ,
                  items: widget.items,
                  addToCart: widget.addToCart,
                  removeFromCart: widget.removeFromCart,
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
