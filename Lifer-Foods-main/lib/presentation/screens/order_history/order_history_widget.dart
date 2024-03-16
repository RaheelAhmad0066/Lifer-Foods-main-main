import 'package:flutter/material.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/res.dart';

class HistoryWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String price;
  final String button1Text;
  final String button2Text;

  const HistoryWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.price,
    required this.button1Text,
    required this.button2Text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(context) * .05,
          vertical: getHeight(context) * .015),
      child: Row(
        children: [
          // Image
          Image.asset(
            imageUrl,
            width: 120,
            height: 120,
          ),

          // Spacer between image and column
          SizedBox(width: getWidth(context) * .03),

          // Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: AppTextStyle.subHeading.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: getHeight(context) * .01),
              // Date
              Text(
                date,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey),
              ),
              SizedBox(height: getHeight(context) * .01),
              // Price
              Text(
                price,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.orange),
              ),
              SizedBox(height: getHeight(context) * .01),
              // Buttons Row
              Row(
                children: [
                  CreateCustomButton(
                    onTap: () {},
                    text: 'Re-Order',
                    round: false,
                  ),
                  const SizedBox(width: 10),
                  CreateCustomButton(
                    text: 'View',
                    onTap: () {},
                    round: false,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
