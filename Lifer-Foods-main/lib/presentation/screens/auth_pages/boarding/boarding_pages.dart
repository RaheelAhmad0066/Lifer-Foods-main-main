import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/PrefUtils.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/constants.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/auth_pages/login/login_screen.dart';

import '../../bottom_navigation/curved_bottom_navigation.dart';
import 'boarding_model.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          padding: EdgeInsets.all(10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: getProportionateHeight(58.sp),
                child: CreateMaterialButton(
                  text: '',
                  width: getProportionateWidth(150.sp),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CurvedNavigationbar(),
                      ),
                    );
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateHeight(58.sp),
                child: CreateCustomButton(
                  text:
                      currentIndex == contents.length - 1 ? "Let's Go" : "Next",
                  round: false,
                  width: getProportionateWidth(183.sp),
                  onTap: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                      return;
                    }
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          currentIndex == contents.length - 1
                              ? "Let's Go"
                              : "Next",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: PageView.builder(
          controller: _controller,
          itemCount: contents.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.only(
                top: getHeight(context) * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: getProportionateWidth(348.sp),
                      height: getProportionateHeight(360.sp),
                      child: Image.asset(
                        contents[i].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateHeight(20.sp)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateWidth(21.sp),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(
                            contents.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                        SizedBox(
                            height: getProportionateHeight(
                          23.sp,
                        )),
                        AutoSizeText(
                          contents[currentIndex].title,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Inter",
                            letterSpacing: -0.72,
                            color: const Color(0xff292D32),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        AutoSizeText(
                          contents[currentIndex].description,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Intel Clear",
                            letterSpacing: -0.17,
                            color: const Color(0xff6A798A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? AppColors.primaryColor : Colors.grey,
      ),
    );
  }
}
