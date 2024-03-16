import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/res.dart';

class CustomDecorator extends StatelessWidget {
  final List<Widget> children;
  final Gradient? gradient;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomDecorator({
    super.key,
    required this.children,
    this.gradient,
    this.padding,
    this.borderRadius = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: gradient ??
              LinearGradient(
                colors: [
                  const Color(0xfffeecc5),
                  Colors.white.withOpacity(0.2)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 1.0],
              ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          )),
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 20.sp, vertical: 25.sp),
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
