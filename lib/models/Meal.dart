class Meal{
  int id;
  String name;
  String MealThumb;

  Meal({
    required this.id,
    required this.name,
    required this.MealThumb,
  });

  Meal.fromJson(Map<String, dynamic> data)
  :
        id = int.parse(data['idMeal']),
        MealThumb =data['strMealThumb'],
        name = data['strMeal'];

  Map<String, dynamic> toJson() => {
    'idMeal': id,
    'strMeal': name,
    'strMealThumb': MealThumb,
  };
}