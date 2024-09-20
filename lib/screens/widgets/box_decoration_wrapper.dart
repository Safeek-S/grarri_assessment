import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ContainerWrapper extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;
  final List<Map<String, dynamic>>? boxShadowValues;
  final Widget childWidget;
  final Gradient? gradient;
  final BoxShape shape;
  const ContainerWrapper({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
    this.color = Colors.blue, // Default color
    this.boxShadowValues,
    required this.childWidget,
    this.padding,
    this.margin,
    this.alignment,
    this.gradient,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  List<BoxShadow>? _generateBoxShadows() {
    return boxShadowValues?.map((shadow) {
      return BoxShadow(
        offset: shadow['offset'] ?? Offset.zero,
        blurRadius: shadow['blurRadius'] ?? 0.0,
        spreadRadius: shadow['spreadRadius'] ?? 0.0,
        color: shadow['color'] ?? Colors.black.withOpacity(0.5),
        inset: shadow['inset'] ?? false,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        shape: shape,
        borderRadius: borderRadius,
        color: color,
        boxShadow: _generateBoxShadows(),
      ),
      child: childWidget,
    );
  }
}
