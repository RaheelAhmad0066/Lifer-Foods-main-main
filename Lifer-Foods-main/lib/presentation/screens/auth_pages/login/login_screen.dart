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
import 'package:lifer_food/presentation/screens/auth_pages/signup/signup.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../foget_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    'Welcome!',
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
                'Sign up or Login to your Account',
                maxLines: 1,
                style: AppTextStyle.greetingStyle.copyWith(
                  fontSize: 17.sp,
                ),
              ),

              ///login/signup bar
              Card(
                margin: EdgeInsets.symmetric(vertical: 5.sp),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Color(0xffffb100))),
                color: Colors.white,
                //const Color.fromRGBO(251, 194, 82, 0.55),

                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateWidth(13.sp),
                      vertical: getProportionateHeight(5.sp)),
                  child: Row(
                    children: [
                      CreateCustomButton(
                        text: 'Login',
                        width: getProportionateWidth(153.sp),
                        height: getProportionateHeight(43.sp),
                        onTap: () {},
                      ),
                      CreateCustomButton(
                        text: '',
                        width: getProportionateWidth(153.sp),
                        height: getProportionateHeight(43.sp),
                        buttonColor: Colors.transparent,
                        textColor: AppColors.primaryColor,
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ));
                        },
                        child: Text(
                          'Signup',
                          style: AppTextStyle.greetingStyle.copyWith(
                            fontSize: 17.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateHeight(18.sp),
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateWidth(13.sp),
                            top: getProportionateHeight(20.sp),
                            bottom: 5.sp),
                        child: Text(
                          'Password',
                          style: AppTextStyle.greetingStyle.copyWith(
                            fontSize: 17.sp,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ),
                      CreateCustomField(
                        backgroundColor: Colors.white,
                        text: 'Enter Your Password',
                        controller: controler.passwordController,
                        icon: Image.asset('assets/images/lock.png'),
                        keyBoardType: TextInputType.emailAddress,
                        isObscure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          } else if (value.length < 5) {
                            return 'Password length is too short';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          child: Text(
                            'Forget Password?',
                            style: AppTextStyle.greetingStyle.copyWith(
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            Get.to(ForgetScreen());
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateHeight(20.sp),
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
                                text: 'Sign In',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    controler.signIn();
                                  }
                                },
                                width: getProportionateWidth(348.sp)),
                      ),
                      SizedBox(
                        height: getProportionateHeight(20.sp),
                      ),
                      const Center(
                        child: Text(
                          'or continue with social login',
                          style: AppTextStyle.greetingStyle,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateHeight(36.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(image: 'google', onTap: () {}),
                          SizedBox(
                            width: 15.sp,
                          ),
                          RoundButton(image: 'Apple', onTap: () {}),
                          SizedBox(
                            width: 15.sp,
                          ),
                          RoundButton(image: 'facebook', onTap: () {}),
                        ],
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
