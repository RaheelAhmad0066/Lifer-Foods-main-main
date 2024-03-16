import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/home_page/home_page.dart';
import 'package:lifer_food/presentation/widgets/custom_decorator.dart';

import '../../screens/bottom_navigation/curved_bottom_navigation.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateWidth(10.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CurvedNavigationbar(),
                          ),
                          (route) => false);
                    },
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
            ),
            SizedBox(
              height: 10.sp,
            ),

            ///main container
            CustomDecorator(
              children: [
                SizedBox(
                  height: 25.sp,
                ),
                Center(child: Image.asset('assets/images/order_placed.png')),
                SizedBox(
                  height: 25.sp,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.sp),
                  child: Text(
                    'Your order has been placed successfully!',
                    style: AppTextStyle.greetingStyle
                        .copyWith(color: AppColors.blackColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset('assets/images/hot_offer.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
