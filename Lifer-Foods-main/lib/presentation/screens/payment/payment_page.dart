import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:card_swiper/card_swiper.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
                const SizedBox(),
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
              'Payment Management',
              style: AppTextStyle.pageTitle.copyWith(fontSize: 28.sp),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              'Available Methods',
              style: TextStyle(
                color: const Color.fromRGBO(140, 140, 140, 0.85),
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColors.primaryColor)),
              child: CheckboxListTile(
                onChanged: (value) {},
                value: true,
                title: const Text('Cash Payment'),
                subtitle: const Text('default method'),
                checkColor: AppColors.whiteColor,
                fillColor: MaterialStateProperty.resolveWith<Color?>(
                  (states) => AppColors.primaryColor,
                ),
                secondary: Image.asset(
                  'assets/images/pay_1.png',
                  height: 35,
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            const Divider(height: 3.5),
            const Divider(height: 3.5),
            SizedBox(
              height: 161,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Other Methods',
                          maxLines: 1,
                          style: AppTextStyle.heading.copyWith(fontSize: 33),
                        ),
                        SizedBox(
                          width: getWidth(context) * .7,
                          child: AutoSizeText(
                            'Below payment methods will be available soon',
                            maxLines: 2,
                            softWrap: true,
                            style: AppTextStyle.greetingStyle.copyWith(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/coming_soon.png',
                      width: 166,
                      height: 161,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(context) * .4,
              child: Swiper(
                itemCount: 3,
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.grey, activeColor: Colors.orange)),
                indicatorLayout: PageIndicatorLayout.COLOR,
                itemBuilder: (context, index) {
                  return Image.asset('assets/images/payment$index.png');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
