import 'package:flutter/material.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';

class SideItemslist extends StatefulWidget {
  @override
  _SideItemslistState createState() => _SideItemslistState();
}

class _SideItemslistState extends State<SideItemslist> {
  int? _selectedItemIndex;

  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/sauce.png',
      'name': 'Medium Fries',
      'price': "\$1.59 ea"
    },
    {
      'image': 'assets/images/fries.png',
      'name': 'Large Fries',
      'price': "\$1.59 ea"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedItemIndex = index;
            });
          },
          child: Material(
            borderRadius: BorderRadius.circular(8.0),
            elevation: _selectedItemIndex == index ? 4.0 : 0.0,
            child: Container(
              height: getProportionateScreenHeight(81),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedItemIndex == index
                      ? Colors.grey
                      : Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: Image.asset(
                  items[index]['image'],
                  width: 40,
                  height: 40,
                ),
                title: Text(items[index]['name']),
                trailing: Radio(
                  activeColor: Color(0xffFFB100),
                  value: index,
                  groupValue: _selectedItemIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedItemIndex = value;
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
