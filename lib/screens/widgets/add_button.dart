import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/widgets/rounded_button.dart';
import 'package:foodorderapp/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/menu_item_model.dart';
import 'button_wrapper.dart';

class AddButton extends StatelessWidget {
  final MenuItem menuItem;
  final Function(MenuItem) addItemsToCart;
  const AddButton(
      {super.key, required this.addItemsToCart, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => addItemsToCart(menuItem),
      child: ButtonWrapper(
        buttonWidgetPadding:
            const EdgeInsets.only(left: 4, right: 8, top: 5, bottom: 5).w,
        width: 72.w,
        height: 32.h,
        buttonWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RoundedButton(icon: Icons.add),
            Padding(
              padding: const EdgeInsets.only(left: 4.0).w,
              child: Text(
                'Add',
                style: GoogleFonts.ubuntu(
                  color: const Color(0xff4A5662),
                  textStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: AppStyle.mediumFont,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
