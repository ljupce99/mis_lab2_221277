class MealCategori{
  int id;
  String category;
  String imgThoumb;
  String opis;

  MealCategori({
    required this.id,
    required this.category,
    required this.imgThoumb,
    required this.opis,
  });
  MealCategori.fromJson(Map<String, dynamic> data)
      : id = int.parse(data['idCategory']),
        imgThoumb =data['strCategoryThumb'],
        category = data['strCategory'],
        opis = data['strCategoryDescription'];
  Map<String, dynamic> toJson() => {
    'idCategory': id,
    'strCategoryThumb': imgThoumb,
    'strCategory': category,
    'strCategoryDescription': opis,
  };

}