import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifer_food/core/AuthControler/auth.dart';
import 'package:lifer_food/core/AuthControler/social_auth.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/auth_pages/login/login_screen.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../bottom_navigation/curved_bottom_navigation.dart';
import '../custom_shape.dart';
import 'signup_componants/validate_otp.dart';
import 'signup_componants/verification_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameCont = TextEditingController();
  final phoneCont = TextEditingController();
  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final controler = Get.find<AuthService>();
  final socialCont = Get.put(SocialAuth());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.fromLTRB(21.sp, 0, 21.sp, 10.sp),
            child: Obx(
              () => controler.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.backgroundColor,
                    ))
                  : CreateCustomButton(
                      round: false,
                      height: getProportionateHeight(58.sp),
                      text: 'Sign Up',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controler.signUp();
                          print(controler.userId);
                        }
                      },
                      width: getProportionateWidth(348.sp)),
            ),
          ),
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
                          text: '',
                          width: getProportionateWidth(153.sp),
                          height: getProportionateHeight(43.sp),
                          buttonColor: Colors.transparent,
                          textColor: AppColors.primaryColor,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: Text(
                            'Login',
                            style: AppTextStyle.greetingStyle.copyWith(
                              fontSize: 17.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        CreateCustomButton(
                          text: 'Signup',
                          width: getProportionateWidth(153.sp),
                          height: getProportionateHeight(43.sp),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateHeight(18.sp),
                ),

                CustomPaint(
                  painter: RPSCustomPainter(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 25.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 13.sp, bottom: 5.sp),
                          child: Text(
                            'Full Name',
                            style: AppTextStyle.greetingStyle.copyWith(
                              fontSize: 17.sp,
                              color: AppColors.darkColor,
                            ),
                          ),
                        ),
                        CreateCustomField(
                          backgroundColor: Colors.white,
                          text: 'Enter Your Name',
                          controller: controler.nameController,
                          icon: Image.asset(
                            'assets/images/person.png',
                          ),
                          keyBoardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Name!';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 13.sp, bottom: 5.sp),
                          child: Text(
                            'Last Name',
                            style: AppTextStyle.greetingStyle.copyWith(
                              fontSize: 17.sp,
                              color: AppColors.darkColor,
                            ),
                          ),
                        ),
                        CreateCustomField(
                          backgroundColor: Colors.white,
                          text: 'Enter Your Last Name',
                          controller: controler.lastnameController,
                          icon: Image.asset(
                            'assets/images/person.png',
                          ),
                          keyBoardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Name!';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 13.sp,
                              top: getProportionateHeight(20.sp),
                              bottom: 5.sp),
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
                              left: 13.sp,
                              top: getProportionateHeight(20.sp),
                              bottom: 5.sp),
                          child: Text(
                            'Phone Number',
                            style: AppTextStyle.greetingStyle.copyWith(
                              fontSize: 17.sp,
                              color: AppColors.darkColor,
                            ),
                          ),
                        ),
                        CustomPhoneField(
                          phoneController: controler.phoneNumberController,
                          phoneNumber: controler.selectedCodeNumber,
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
                        SizedBox(
                          height: getProportionateHeight(20.sp),
                        ),
                        const Center(
                          child: Text(
                            'or continue with social ',
                            style: AppTextStyle.greetingStyle,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateHeight(20.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                                image: 'google',
                                onTap: () {
                                  socialCont.signInWithGoogle();
                                }),
                            SizedBox(
                              width: 15.sp,
                            ),
                            RoundButton(
                                image: 'Apple',
                                onTap: () {
                                  socialCont.signInWithApple();
                                }),
                            SizedBox(
                              width: 15.sp,
                            ),
                            RoundButton(
                                image: 'facebook',
                                onTap: () {
                                  socialCont.signInWithFacebook();
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
