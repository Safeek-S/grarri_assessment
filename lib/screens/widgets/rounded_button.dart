import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  const RoundedButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7).w,
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        shape: BoxShape.circle,
        boxShadow: [
         
          BoxShadow(
            color: const Color(0xffDEDEDE).withOpacity(0.9),
            offset: const Offset(2, 2),
            blurRadius: 5,
          ),
          const BoxShadow(
            color: Color(0xFFFFFFE5),
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: const Color(0xffDEDEDE).withOpacity(0.2),
            offset: const Offset(2, -2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: const Color(0xffDEDEDE).withOpacity(0.2),
            offset: const Offset(-2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 15.w,
        color: const Color(0xff3CBCB4),
      ),
    );
  }
}
