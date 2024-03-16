import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifer_food/core/AuthControler/auth.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/auth_pages/custom_shape.dart';
import '../../../../core/utils/custom_text_field.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final controler = Get.find<AuthService>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 21.sp, vertical: 5.sp),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forget Password',
                    style: AppTextStyle.heading.copyWith(
                      fontSize: getProportionateWidth(36.sp),
                    ),
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
                'change forget password',
                maxLines: 1,
                style: AppTextStyle.greetingStyle.copyWith(
                  fontSize: 17.sp,
                ),
              ),

              SizedBox(
                height: getProportionateHeight(88.h),
              ),

              ///customShape
              CustomPaint(
                painter: RPSCustomPainter(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 25.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateHeight(5.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp, bottom: 5.sp),
                        child: Text(
                          'Email Address',
                          style: AppTextStyle.greetingStyle.copyWith(
                            fontSize: 17.sp,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ),
                      CreateCustomField(
                        backgroundColor: Colors.white,
                        text: 'Enter Your Email',
                        controller: controler.emailController,
                        icon: Image.asset(
                          'assets/images/email.png',
                        ),
                        keyBoardType: TextInputType.emailAddress,
                        validator: (value) {
                          Pattern pattern =
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?)*$";
                          RegExp regex = RegExp(pattern.toString());
                          if (value == null) {
                            return 'Enter an Email Address!';
                          } else if (!regex.hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getProportionateHeight(45.sp),
                      ),
                      Obx(
                        () => controler.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.backgroundColor,
                                ),
                              )
                            : CreateCustomButton(
                                round: false,
                                height: getProportionateHeight(58.sp),
                                text: 'Change Password',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    controler.forgetPassword();
                                  }
                                },
                                width: getProportionateWidth(348.sp)),
                      ),
                      SizedBox(
                        height: getProportionateHeight(20.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateHeight(18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
