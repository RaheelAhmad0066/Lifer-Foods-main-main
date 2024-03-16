// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifer_food/core/utils/app_color.dart';

final Shader linearGradient = const LinearGradient(
  colors: <Color>[AppColor.lightMainColor1, AppColor.lightMainColor2],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class AppTextStyle {
  static const heading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: Color(0xff292D32),
    letterSpacing: -0.72,
  );
  static const title = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
  static const title2 = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
  static const title3 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColor.white,
  );
  static const TextStyle buttonTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );
  static TextStyle navBar = const TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
  static TextStyle text = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static TextStyle smallButton = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.mainColor,
  );
  static const userName = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );
  static const userToken = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static const homeCardDescription = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );
  static const sectionHeader = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColor.textDarkColor,
  );
  static const sectionCard = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
  );
  static const sectionCardDetail = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static const versionCode = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.textDarkColor,
  );
  static const textLabel = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.gray,
  );
  static TextStyle textHint = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.mainTextColor.withOpacity(0.5),
  );
  static const textField = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColor.mainTextColor,
  );
  static const textError = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColor.error,
  );
  static const homeStreakLabel = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static const homeStreakGoal = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.textLightColor,
  );
  static const homeStepLabel = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColor.textLightColor,
  );
  static const homeStepValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: AppColor.labelTintColor,
  );
  static const newsTitle = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Color(0xff11142d),
  );
  static const homeStepCoin = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.textLightColor,
  );
  static const homeRewardsLabel = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
  static const homeRewardsValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static const homeWalletValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: AppColor.white,
  );
  static const homeWalletUSDValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: AppColor.white,
  );
  static const homeWalletAddress = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );
  static const homeCardValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: AppColor.textLightColor,
  );
  static const completeButton = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );
  static const dailyGoalValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColor.goalValueColor,
  );
  static const dailyStepValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColor.textLightColor,
  );
  static const dailyLabel = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColor.white,
  );
  static const dailyValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColor.textLightColor,
  );
  static const dailySubValue = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.textLightColor,
  );
  static const dailyDate = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColor.textLightColor,
  );
  static const walletAddress = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColor.labelTintColor,
  );
  static const amountWalletLabel = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColor.labelTintColor,
  );
  static const locationPermissionTitle = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.goalValueColor,
  );
  static const descriptionLabel = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.textLightColor,
  );
  static const caption = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColor.textLightColor,
  );
  static const terms = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColor.textLightColor,
  );
  static const payment = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.black,
  );
  static const paymentSub = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
  static const stockLabel = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
  static const subTitle1 = TextStyle(
    fontFamily: 'SFProRounded',
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: AppColor.black,
  );
  static const itemText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColor.itemColor,
  );
  static const subHeading = TextStyle(
    fontFamily: 'Inter',
    color: Color.fromRGBO(140, 140, 140, 0.85),
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
  static const greetingStyle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(140, 140, 140, 0.85),
      letterSpacing: -0.17);
  static const pageTitle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: Color(0xff292d32),
      letterSpacing: -1.8);
  static const categoryTitle = TextStyle(
    fontFamily: 'Intel Clear',
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Color(0xff292d32),
  );
}
