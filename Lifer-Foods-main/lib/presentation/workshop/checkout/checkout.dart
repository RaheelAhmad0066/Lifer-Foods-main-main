import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/widgets/custom_decorator.dart';
import 'package:lifer_food/presentation/workshop/checkout/order_placed.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool showLocation = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CreateCustomButton(
          text: 'Place Order',
          round: false,
          width: getWidth(context),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderPlaced(),
                ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/tick.png', width: 20, height: 20),
              const SizedBox(width: 10),
              Text('Place Order', style: TextStyle(fontSize: 16.sp),),
            ],
          ),
        ),
      ),
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
            ),
            SizedBox(
              height: 10.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateWidth(15.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Checkout',
                    style: AppTextStyle.pageTitle.copyWith(fontSize: 36.sp),
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
                _paymentSection(),
                const Text('Select Location', style: AppTextStyle.subHeading),
                SizedBox(height: 10.sp),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: !showLocation
                          ? BorderSide.none
                          : BorderSide(
                              color: AppColors.primaryColor, width: 2)),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/current_location.png',
                      width: 25,
                      height: 25,
                    ),
                    title: const Text('Use current location'),
                    onTap: () {
                      setState(() {
                        showLocation = !showLocation; //true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                showLocation
                    ? const ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text('148 House, Gulburg 3, Lahore'),
                      )
                    : SizedBox(
                        height: 40.sp,
                      ),
                Container(
                  height: 200,
                  width: getWidth(context),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/map.png'),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 20, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/gps.png'),
                                const Text('Pin Location'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _paymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Payment Method', style: AppTextStyle.subHeading),
        SizedBox(height: 10.sp),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.primaryColor)),
          child: CheckboxListTile(
            onChanged: (value) {},
            value: true,
            title: const Text('Cash on Delivery', style: AppTextStyle.payment),
            subtitle:
                const Text('Default method', style: AppTextStyle.paymentSub),
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
        SizedBox(height: 10.sp),
      ],
    );
  }
}
