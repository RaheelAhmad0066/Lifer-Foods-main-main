import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/bottom_navigation/curved_bottom_navigation.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({super.key, required this.email});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10.sp, horizontal: getProportionateWidth(15.sp)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.sp),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 42.sp,
                      width: 37.sp,
                    ),
                  ),
                ],
              ),
              AutoSizeText(
                'Verify Email Address',
                style: AppTextStyle.heading.copyWith(
                  fontSize: 32,
                ),
                maxLines: 1,
              ),
              SizedBox(
                height: 24.sp,
              ),
              Image.asset(
                'assets/images/verification_check.png',
                width: getProportionateWidth(280.sp),
                height: getProportionateHeight(280.sp),
              ),
              Center(
                child: SizedBox(
                  height: 204.sp,
                  width: 256.sp,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -50.sp,
                        child: Container(
                          height: 204.sp,
                          width: 260.sp,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 177, 0, 0.94),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:
                                        'a verification email has been sent to\n',
                                    style: AppTextStyle.buttonTitle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.60),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: widget.email,
                                        style:
                                            AppTextStyle.buttonTitle.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.60),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ', click on the link in the email to verify and come back',
                                        style:
                                            AppTextStyle.buttonTitle.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.60),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              CreateCustomButton(
                                text: 'Resend',
                                buttonColor: Colors.white,
                                textColor: AppColors.primaryColor,
                                width: getProportionateWidth(192.sp),
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              CreateCustomButton(
                text: "",
                round: false,
                width: getProportionateWidth(183.sp),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurvedNavigationbar(),
                      ));
                },
                buttonColor: AppColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify and Continue",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      const Icon(Icons.check_circle_outline),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
