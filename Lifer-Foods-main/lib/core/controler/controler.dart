import 'package:get/get.dart';

class CounterControler extends GetxController {
  var counter = 0.obs;
  RxBool isvisible1 = true.obs;
  RxBool isvisible2 = true.obs;
  RxBool isvisible3 = true.obs;

  void increment() {
    counter.value++;
  }

  void dicrement() {
    if (counter.value > 1) {
      counter.value--;
    }
  }

// list vissible
  void toggle1() {
    isvisible1.toggle();
  }

  void toggle2() {
    isvisible2.toggle();
  }

  void toggle3() {
    isvisible3.toggle();
  }

  List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/bnd.png',
      'name': 'Sesame Seed Bun',
      'price': "\$1.59 ea",
      'count': 0
    },
    {
      'image': 'assets/images/sauce.png',
      'name': 'Sauce',
      'price': "\$1.59 ea",
      'count': 0
    },
    {
      'image': 'assets/images/beef.png',
      'name': 'Beef Patty',
      'price': "\$1.59 ea",
      'count': 0
    },
    {
      'image': 'assets/images/cheeze.png',
      'name': 'Cheese',
      'price': "\$0.59 ea",
      'count': 0
    },
  ];

  void incrementItem(int index) {
    items[index]['count']++;
    update(); // Refresh the UI after updating count
  }

  void decrementItem(int index) {
    if (items[index]['count'] > 0) {
      items[index]['count']--;
      update(); // Refresh the UI after updating count
    }
  }
}
