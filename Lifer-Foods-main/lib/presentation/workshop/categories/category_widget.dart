import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/presentation/workshop/categories/category_details.dart';
import 'package:lifer_food/presentation/workshop/categories/category_mode.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailsPage(category: category),
            ));
      },
      child: Container(
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: const Color(0xfffbc252).withOpacity(0.24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.categoryImage,
              width: 100.sp,
              height: 30.sp,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              category.categoryName,
              style: AppTextStyle.categoryTitle.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
