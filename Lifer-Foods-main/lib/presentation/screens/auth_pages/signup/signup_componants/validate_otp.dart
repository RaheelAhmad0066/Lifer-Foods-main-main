import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifer_food/core/AuthControler/auth.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ValidateOtp extends StatefulWidget {
  const ValidateOtp({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ValidateOtpState();
}

class _ValidateOtpState extends State<ValidateOtp> {
  final otpCont = TextEditingController();

  int _timeRemaining = 120;
  late Timer _timer;
  bool isValidated = false;
  String bottomMsg1 = 'OTP verified';
  String bottomMsg2 = ' Successfully';

  @override
  void initState() {
    startCountDown();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final controler = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
              vertical: 10.sp, horizontal: getProportionateWidth(15.sp)),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back'),
              ),
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 142.sp,
            ),
            AutoSizeText(
              'Verify your email address',
              style: AppTextStyle.heading.copyWith(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            const AutoSizeText(
              'Enter 4-digit code sent to your email address',
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(
              height: getHeight(context) * .03,
            ),
            PinCodeTextField(
              controller: otpCont,
              appContext: context,
              enableActiveFill: true,
              //backgroundColor: const Color(0xffFFF4D9),
              autoDisposeControllers: false,
              length: 6,
              onChanged: (value) {},
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.normal),
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  activeColor: const Color(0xffFFF4D9),
                  inactiveColor: const Color(0xffFFF4D9),
                  activeFillColor: const Color(0xffFFF4D9),
                  inactiveFillColor: const Color(0xffFFF4D9),
                  selectedFillColor: const Color(0xffFFF4D9),
                  fieldWidth: 50),
            ),
            Obx(
              () => controler.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getHeight(context) * .035),
                      child: CreateGradientButton(
                          text: 'Continue',
                          onTap: () {
                            controler.verifyEmail(otpCont.text);
                          },
                          width: getWidth(context) * .9),
                    ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(context) * .035),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          text:
                              isValidated ? bottomMsg1 : 'OTP Auto resend in '),
                      TextSpan(
                          text: isValidated ? bottomMsg2 : '$_timeRemaining',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: isValidated ? '.' : ' sec')
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  startCountDown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeRemaining == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _timeRemaining--;
          });
        }
      },
    );
  }

  showSuccess() {
    setState(() {
      isValidated = true;
    });
    Timer(const Duration(seconds: 2), () {
      // widget.isSignup
      //     ? Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => const SignupAccountMode()))
      //     : Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const ChangePassword()));
    });
  }
}
