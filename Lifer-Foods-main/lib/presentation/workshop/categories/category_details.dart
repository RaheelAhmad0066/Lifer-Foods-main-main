import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lifer_food/core/utils/app_textstyle.dart';
import 'package:lifer_food/presentation/workshop/categories/category_mode.dart';

class CategoryDetailsPage extends StatefulWidget {
  final CategoryModel category;

  const CategoryDetailsPage({super.key, required this.category});

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          ///heading
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.sp),
            child: Text(
              widget.category.categoryName,
              style: AppTextStyle.pageTitle,
            ),
          ),

          ///listTiles
          Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Color(0xffd5dee7),
              ),
            )),
            child: ListTile(
              leading: Image.asset('assets/images/burgers.png'),
              title: const Text('BBQ Chicken Burger'),
              subtitle: const Text('KFC'),
              trailing: const Icon(Icons.arrow_forward_ios),
              //style: ListTileStyle.list,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Color(0xffd5dee7),
              ),
            )),
            child: ListTile(
              leading: Image.asset('assets/images/burgers.png'),
              title: const Text('BBQ Chicken Burger'),
              subtitle: const Text('KFC'),
              trailing: const Icon(Icons.arrow_forward_ios),
              //style: ListTileStyle.list,
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffd5dee7),
                ),
              ),
            ),
            child: ListTile(
              leading: Image.asset('assets/images/mc_icon.png'),
              title: const Text("McDonald's"),
              subtitle: const Text(''),
              trailing: const Icon(Icons.arrow_forward_ios),
              //style: ListTileStyle.list,
            ),
          ),

          SvgPicture.asset(
            'assets/images/boarding1.svg',
            placeholderBuilder: (context) {
              return Image.asset('assets/images/boarding1.png');
            },
          ),
        ],
      ),
    );
  }
}
