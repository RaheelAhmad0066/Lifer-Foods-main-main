class BoardingModel {
  final String image, title, description;

  BoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<BoardingModel> contents = [
  BoardingModel(
      image: 'assets/images/boarding1.png',
      title: 'Wide range of Food Categories & more',
      description:
          "Browse through our extensive list of restaurants and dishes, and when you're ready to order, simply add your desired items to your cart and checkout. It's that easy!"),
  BoardingModel(
      image: 'assets/images/boarding2.png',
      title: 'Free Deliveries for ONE MONTH!!',
      description:
          "Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjoy a whole month of complimentary delivery!"),
  BoardingModel(
      image: 'assets/images/boarding3.png',
      title: 'Get started on Ordering your Food',
      description:
          "Please create an account or sign in to your existing account to start browsing our selection of delicious meals from your favorite restaurants."),
];
