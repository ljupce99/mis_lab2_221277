class MealDetails {
  int id;
  String name;
  String mealThumb;
  String instructinon;
  String videoLink;
  List<String> sostojki=[];


  MealDetails({
    required this.id,
    required this.name,
    required this.mealThumb,
    required this.instructinon,
    required this.videoLink,


  });

  MealDetails.fromJson(Map<String, dynamic> data)
      : id = int.parse(data['idMeal']),
        name = data['strMeal'],
        mealThumb = data['strMealThumb'],
        instructinon = data['strInstructions'],
        videoLink = data['strYoutube'] ?? ''{

    for (int i = 1; i <= 20; i++) {

      final ingredient = data['strIngredient$i'];

      if (ingredient != null && ingredient != '') {
        sostojki.add(ingredient.toString());
      }
    }
  }



  Map<String, dynamic> toJson() => {
    'idMeal': id,
    'strMeal': name,
    'strMealThumb': mealThumb,
    'strInstructions': instructinon,
    'strYoutube': videoLink,
    'ingredients': sostojki,
  };
}
