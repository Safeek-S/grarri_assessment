import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/models/menu_item_model.dart';
import 'package:foodorderapp/screens/widgets/add_button.dart';
import 'package:foodorderapp/screens/widgets/box_decoration_wrapper.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../utils.dart';

class SpecialMenuListTile extends StatelessWidget {
  final MenuItem? menuItem;
  final Function(MenuItem) callBack;
  const SpecialMenuListTile({this.menuItem, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      height: 200.h,
      width: 160.w,
      color: const Color(0xffF1F1F1),
      borderRadius: BorderRadius.circular(8.0).w,
      boxShadowValues: [
        {
          'color': const Color(0xffCDCDCD).withOpacity(0.9),
          'offset': const Offset(2, 2),
          'blurRadius': 5.0,
          'spreadRadius': 0.0,
          'inset': true,
        },
        {
          'color': const Color(0xffFFFFFF).withOpacity(0.9),
          'offset': const Offset(-2, -2),
          'blurRadius': 4.0,
          'spreadRadius': 0.0,
          'inset': true,
        },
        {
          'color': const Color(0xffCDCDCD).withOpacity(0.2),
          'offset': const Offset(2, -2),
          'blurRadius': 4.0,
          'spreadRadius': 0.0,
          'inset': true,
        },
        {
          'color': const Color(0xffCDCDCD).withOpacity(0.2),
          'offset': const Offset(-2, 2),
          'blurRadius': 4.0,
          'spreadRadius': 0.0,
          'inset': true,
        },
      ],
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
          flex:5,
            child: Image.asset(
              menuItem!.imagePath,
              width: 160.w,
              height: 140.h,
              fit: BoxFit.fill,
            ),
          ),
          5.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 8).w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'lib/assets/images/veg.png',
                width: 16.w,
                height: 16.h,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4).w,
                  child: FittedBox(
                    child: Text(
                      menuItem!.name,
                      overflow: TextOverflow.visible, // Ensure text does not overflow
                      maxLines: 3,
                      // textAlign: TextAlign.left, // Align the text to the left
                      style: GoogleFonts.ubuntu(
                        color: const Color(0xff4A5662),
                        textStyle: TextStyle(
                            fontWeight: AppStyle.mediumFont, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8,top: 8).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\u{20B9}299',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 13.sp, fontWeight: AppStyle.mediumFont),
                    color: const Color(0xff4A5662),
                  ),
                ),
                AddButton(
                  addItemsToCart: callBack,
                  menuItem: menuItem!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
