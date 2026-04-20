class Dish {
  final String name;
  final String kcal;
  final String price;
  final String description;
  final String category;
  final NutritionalInfo nutritionalInfo;

  Dish({
    required this.name,
    required this.kcal,
    required this.price,
    required this.description,
    required this.category,
    required this.nutritionalInfo,
  });
}

class NutritionalInfo {
  final String protein;
  final String carbs;
  final String fat;
  final String fiber;
  final List<String> allergens;

  NutritionalInfo({
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.fiber,
    required this.allergens,
  });
}