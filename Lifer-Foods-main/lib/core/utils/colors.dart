import 'dart:ui';
class AppColors{
  static final Color whiteColor = HexColor.fromHex("#FFFFFF");
  static final Color greenColor = HexColor.fromHex("#26C486");
  static final Color lightGreenColor = HexColor.fromHex("#26C48612");
  static final Color darkGreenColor = HexColor.fromHex("#298A3A");
  static final Color darkGreen = HexColor.fromHex("#118D5E");
  static final Color inputColor = HexColor.fromHex("#515C6F");
  static final Color blackColor = HexColor.fromHex("#2D2D2D");
  static final Color lightBlackColor = HexColor.fromHex("#141414");
  static final Color greyColor = HexColor.fromHex("#ECECEC");
  static final Color borderColor = HexColor.fromHex("#727C8E");
  static final Color darkGreyColor = HexColor.fromHex("#7B7B7B");
  static final Color shadowColor = HexColor.fromHex("#A4A4A4");
  static final Color headerColor = HexColor.fromHex("#4B4B4B");
  static final Color headingColor = HexColor.fromHex("#646464");
  static final Color yellowColor = HexColor.fromHex("#E2AA0F");
  static final Color backgroundColor = HexColor.fromHex("#E5E5E5");
  static final Color darkBlueColor = HexColor.fromHex("#003B49");
  static final Color lightGreyColor = HexColor.fromHex("#8F92A1");
  static final Color chatBgColor = HexColor.fromHex("#DBDBDB");
  static final Color messageInputColor = HexColor.fromHex("#DBDBDB");
  static final Color primaryColor = HexColor.fromHex("#FFB100");
  static final Color darkColor = HexColor.fromHex("#292D32");
  static const Color mainColor = Color.fromRGBO(142, 207, 0, 1);

}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}