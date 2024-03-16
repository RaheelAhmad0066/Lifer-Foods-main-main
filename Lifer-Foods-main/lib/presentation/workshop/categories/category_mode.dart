class CategoryModel {
  final String categoryName;
  final String categoryId;
  final String categoryImage;

  CategoryModel({
    required this.categoryName,
    required this.categoryId,
    required this.categoryImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json['categoryName'] as String,
      categoryId: json['categoryId'] as String,
      categoryImage: json['categoryImage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'categoryId': categoryId,
      'categoryImage': categoryImage,
    };
  }
}

