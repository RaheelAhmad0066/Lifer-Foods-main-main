import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/size_config.dart';

import '../screens/cart_page/cart.dart';
import '../screens/order_history/order_history.dart';

class Workshop extends StatefulWidget {
  const Workshop({super.key});

  @override
  State<Workshop> createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              vertical: 10.sp, horizontal: getProportionateWidth(15.sp)),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
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
            SizedBox(
              height: 10.sp,
            ),
            AutoSizeText(
              'Workshop',
              style: AppTextStyle.pageTitle.copyWith(fontSize: 36.sp),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              'Create independent widgets here',
              style: TextStyle(
                color: const Color.fromRGBO(140, 140, 140, 0.85),
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),

            CreateCustomButton(
              text: 'Cart Page',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
            ),
            SizedBox(
              height: 10.sp,
            ),

            CreateCustomButton(
              text: 'History Page',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrdersHistory(),
                    ));
              },
            ),
            SizedBox(
              height: 10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
