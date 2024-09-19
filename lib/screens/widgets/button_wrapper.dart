import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWrapper extends StatelessWidget {
  final double width, height;
  final EdgeInsetsGeometry buttonWidgetPadding;
  final Widget buttonWidget;
  const ButtonWrapper(
      {super.key,
      required this.width,
      required this.height,
      required this.buttonWidget, required this.buttonWidgetPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: buttonWidgetPadding,
      decoration: BoxDecoration(
        color: const Color(0xffF0F0F3),
        borderRadius: BorderRadius.circular(10).w,
        boxShadow: [
         
          BoxShadow(
            color: const Color(0xffDDDDE0).withOpacity(0.9),
            offset: const Offset(5, 5),
            blurRadius: 13,
          ),
          BoxShadow(
            color: const Color(0xFFFFFFFF).withOpacity(0.9),
            offset: const Offset(-5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: const Color(0xffDDDDE0).withOpacity(0.2),
            offset: const Offset(5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: const Color(0xffDDDDE0).withOpacity(0.2),
            offset: const Offset(-5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      width: width,
      height: height,
      child: buttonWidget,
    );
  }
}
