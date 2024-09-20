import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorderapp/screens/widgets/box_decoration_wrapper.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  const RoundedButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      padding: const EdgeInsets.all(7).w,
      color: const Color(0xffF1F1F1),
      shape: BoxShape.circle,
      boxShadowValues: [
        {
          "color": const Color(0xffDEDEDE).withOpacity(0.9),
          "offset": const Offset(2, 2),
          "blurRadius": 5.0,
          "inset": true,
        },
        {
          "color": Color(0xFFFFFFE5).withOpacity(0.9),
          "offset": Offset(-2, -2),
          "blurRadius": 4.0,
          "inset": true,
        },
        {
          "color": const Color(0xffDEDEDE).withOpacity(0.2),
          "offset": const Offset(2, -2),
          "blurRadius": 4.0,
          "inset": true,
        },
        {
          "color": const Color(0xffDEDEDE).withOpacity(0.2),
          "offset": const Offset(-2, 2),
          "blurRadius": 4.0,
          "inset": true,
        },
      ],
      childWidget: Icon(
        icon,
        size: 15.w,
        color: const Color(0xff3CBCB4),
      ),
    );
  }
}
