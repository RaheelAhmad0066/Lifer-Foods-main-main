import 'package:lifer_food/core/utils/app_images.dart';

class Food {
  final String imageUrl;

  Food({required this.imageUrl});
}

List<Food> foods = [
  Food(imageUrl: AppImages.food1),
  Food(imageUrl: AppImages.food2),
  Food(imageUrl: AppImages.food3),
];
