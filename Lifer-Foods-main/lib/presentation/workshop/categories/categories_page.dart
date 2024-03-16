import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/custom_text_field.dart';
import 'package:lifer_food/presentation/workshop/categories/category_widget.dart';

import 'category_mode.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/back_arrow.png'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'All Categories',
                style: AppTextStyle.pageTitle.copyWith(fontSize: 26.sp),
              ),
              SizedBox(
                height: 12.sp,
              ),
              CreateSearchField(
                controller: searchCont,
                icon: const Icon(Icons.search),
                backgroundColor: const Color(0xffeff2f5),
                autoFocus: false,
              ),
              SizedBox(
                height: 18.sp,
              ),
              Expanded(
                  child: GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15.sp,
                  crossAxisSpacing: 15.sp,
                ),
                itemBuilder: (context, index) {
                  return CategoryWidget(
                    category: CategoryModel(
                        categoryId: '009',
                        categoryName: 'Burgers',
                        categoryImage: 'assets/images/burgers.png'),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
