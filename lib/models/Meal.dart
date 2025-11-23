class Meal {
  int id;
  String name;
  String mealThumb;
  String category;

  Meal({
    required this.id,
    required this.name,
    required this.mealThumb,
    this.category = "",
  });

  Meal.fromJson(Map<String, dynamic> data)
      : id = int.parse(data['idMeal']),
        mealThumb = data['strMealThumb'],
        name = data['strMeal'],
        category = data['strCategory'] ?? "";

  Map<String, dynamic> toJson() => {
    'idMeal': id,
    'strMeal': name,
    'strMealThumb': mealThumb,
    'strCategory': category,
  };
}
