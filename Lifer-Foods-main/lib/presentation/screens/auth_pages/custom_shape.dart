import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9958486, size.height * 0.9631117);
    path_0.lineTo(size.width * 0.9929000, size.height * 0.03677302);
    path_0.cubicTo(
        size.width * 0.9928400,
        size.height * 0.01779416,
        size.width * 0.9672057,
        size.height * 0.002438282,
        size.width * 0.9356486,
        size.height * 0.002474605);
    path_0.lineTo(size.width * 0.7453371, size.height * 0.002693694);
    path_0.lineTo(size.width * 0.6260743, size.height * 0.03674931);
    path_0.lineTo(size.width * 0.3803600, size.height * 0.03673127);
    path_0.lineTo(size.width * 0.2703454, size.height * 0.001962784);
    path_0.lineTo(size.width * 0.05957400, size.height * 0.003212698);
    path_0.cubicTo(
        size.width * 0.02822874,
        size.height * 0.003398591,
        size.width * 0.002984114,
        size.height * 0.01873557,
        size.width * 0.002994486,
        size.height * 0.03758660);
    path_0.lineTo(size.width * 0.003503086, size.height * 0.9629931);
    path_0.cubicTo(
        size.width * 0.003513514,
        size.height * 0.9819639,
        size.width * 0.02908771,
        size.height * 0.9973419,
        size.width * 0.06063514,
        size.height * 0.9973454);
    path_0.lineTo(size.width * 0.7460029, size.height * 0.9974227);
    path_0.lineTo(size.width * 0.9386486, size.height * 0.9975430);
    path_0.cubicTo(
        size.width * 0.9702714,
        size.height * 0.9975619,
        size.width * 0.9959086,
        size.height * 0.9821306,
        size.width * 0.9958486,
        size.height * 0.9631117);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffE9E9E9).withOpacity(0.32);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7453343, size.height * 0.001834588);
    path_1.lineTo(size.width * 0.7450143, size.height * 0.001834966);
    path_1.lineTo(size.width * 0.7447229, size.height * 0.001917646);
    path_1.lineTo(size.width * 0.6257543, size.height * 0.03589021);
    path_1.lineTo(size.width * 0.3807143, size.height * 0.03587216);
    path_1.lineTo(size.width * 0.2710100, size.height * 0.001202296);
    path_1.lineTo(size.width * 0.2706911, size.height * 0.001101586);
    path_1.lineTo(size.width * 0.2703311, size.height * 0.001103720);
    path_1.lineTo(size.width * 0.05955971, size.height * 0.002353643);
    path_1.cubicTo(
        size.width * 0.02743103,
        size.height * 0.002544175,
        size.width * 0.001555294,
        size.height * 0.01826460,
        size.width * 0.001565914,
        size.height * 0.03758694);
    path_1.lineTo(size.width * 0.002074509, size.height * 0.9629931);
    path_1.cubicTo(
        size.width * 0.002085197,
        size.height * 0.9824399,
        size.width * 0.02829869,
        size.height * 0.9982010,
        size.width * 0.06063486,
        size.height * 0.9982045);
    path_1.lineTo(size.width * 0.7460029, size.height * 0.9982818);
    path_1.lineTo(size.width * 0.9386457, size.height * 0.9984021);
    path_1.cubicTo(
        size.width * 0.9710600,
        size.height * 0.9984210,
        size.width * 0.9973400,
        size.height * 0.9826048,
        size.width * 0.9972771,
        size.height * 0.9631100);
    path_1.lineTo(size.width * 0.9943286, size.height * 0.03677131);
    path_1.cubicTo(
        size.width * 0.9942657,
        size.height * 0.01731804,
        size.width * 0.9679943,
        size.height * 0.001578259,
        size.width * 0.9356457,
        size.height * 0.001615500);
    path_1.lineTo(size.width * 0.7453343, size.height * 0.001834588);
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint1Stroke.color = const Color(0xff1554AA).withOpacity(0.24);
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
