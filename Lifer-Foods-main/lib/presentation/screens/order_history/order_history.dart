import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';

import 'package:lifer_food/core/utils/size_config.dart';
import 'package:lifer_food/presentation/screens/order_history/order_history_widget.dart';


class OrdersHistory extends StatefulWidget {
  const OrdersHistory({super.key});

  @override
  State<OrdersHistory> createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateWidth(15.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Order History',
                    style: AppTextStyle.pageTitle.copyWith(fontSize: 36.sp),
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
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return HistoryWidget(
                    imageUrl: 'assets/images/history_${index + 1}.png',
                    title: 'Fluffy French Toast',
                    date: '12 Dec, 2023',
                    price: 'PKR.100',
                    button1Text: 'Re-order',
                    button2Text: 'Rate');
              },
            ),
            //static widgets
            const HistoryWidget(
                imageUrl: 'assets/images/history_1.png',
                title: 'Fluffy French Toast',
                date: '12 Dec, 2023',
                price: 'PKR.100',
                button1Text: 'Re-order',
                button2Text: 'Rate'),
            const HistoryWidget(
                imageUrl: 'assets/images/history_2.png',
                title: 'Lamb Ragu Pasta',
                date: '12 Dec, 2023',
                price: 'PKR.100',
                button1Text: 'Re-order',
                button2Text: 'Rate'),
            const HistoryWidget(
                imageUrl: 'assets/images/history_3.png',
                title: 'Chicken Noodles',
                date: '12 Dec, 2023',
                price: 'PKR.100',
                button1Text: 'Re-order',
                button2Text: 'Rate'),
          ],
        ),
      ),
    );
  }
}
