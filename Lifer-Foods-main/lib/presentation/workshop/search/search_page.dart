import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/core/utils/colors.dart';
import 'package:lifer_food/core/utils/custom_buttons.dart';
import 'package:lifer_food/core/utils/custom_text_field.dart';
import 'package:lifer_food/core/utils/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lifer_food/presentation/screens/rasturant.dart';
import 'package:lifer_food/presentation/workshop/categories/categories_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchCont = TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: AppTextStyle.heading.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesPage(),
                        ));
                  },
                  color: const Color(0xfff3f0d5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      children: [
                        Image.asset('assets/images/filter.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Category',
                          style: AppTextStyle.greetingStyle.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24.sp,
            ),
            CreateSearchField(
              controller: searchCont,
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onChanged: (value) {
                setState(() {});
              },
              onSearched: (value) {},
              onTap: () {
                searchCont.clear();
                setState(() {});
              },
              autoFocus: true,
              hint: 'Search Food, Restaurants etc.',
              backgroundColor: const Color.fromRGBO(239, 242, 245, 0.68),
            ),
            SizedBox(
              height: 24.sp,
            ),
            if (searchCont.text.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading:
                        Image.asset('assets/images/kfc_logo.png', width: 40),
                    title: const Text('KFC'),
                    subtitle: const Text('location details'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recently Searched',
                  style: AppTextStyle.heading.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Clear',
                      style: TextStyle(color: AppColors.primaryColor),
                    )),
              ],
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    // Specify a key if the Slidable is dismissible.
                    key: ValueKey(index),
                    startActionPane: const ActionPane(
                      motion: ScrollMotion(),
                      children: [],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading:
                            Image.asset('assets/images/mc_logo.png', width: 40),
                        title: const Text('Macdonalds'),
                        subtitle: const Text('location details'),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Discoverypage(),));
                            },
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
