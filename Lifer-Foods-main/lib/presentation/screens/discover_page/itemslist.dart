import 'package:flutter/material.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  int? _selectedItemIndex;

  final List<Map<String, dynamic>> items = [
    {'image': 'assets/images/coke.png', 'name': 'Regular Cola'},
    {'image': 'assets/images/ginger.png', 'name': 'Orange Juice'},
    {'image': 'assets/images/orange.png', 'name': 'Ginger Shot Juice'},
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
