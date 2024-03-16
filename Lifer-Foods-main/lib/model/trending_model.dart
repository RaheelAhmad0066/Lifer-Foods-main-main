import 'package:lifer_food/core/utils/app_images.dart';

class TrendingItem {
  final String image;
  final double distance;
  final String logo;

  final bool isStarred;
  final String restaurant;

  TrendingItem({
    required this.image,
    required this.distance,
    required this.logo,
    required this.isStarred,
    required this.restaurant,
  });
}

List<TrendingItem> trendingItems = [
  TrendingItem(
    image: AppImages.trend2,
    distance: 1.8,
    logo: AppImages.kfc,
    isStarred: false,
    restaurant: 'KFC',
  ),
  TrendingItem(
    image: AppImages.trend1,
    distance: 2.5,
    logo: AppImages.harvey,
    isStarred: true,
    restaurant: 'Harvey’s',
  ),
  TrendingItem(
    image: AppImages.trend2,
    distance: 1.8,
    logo: AppImages.kfc,
    isStarred: false,
    restaurant: 'KFC',
  ),
  // Add more dummy data items as needed
];
