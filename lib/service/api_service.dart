import 'dart:convert';

import 'package:mis_lab2_221277/models/Meal.dart';
import 'package:mis_lab2_221277/models/MealCategor.dart';
import 'package:http/http.dart' as http;



class ApiService {
  Future<List<MealCategori>> loadMealCategoryList() async {
    List<MealCategori> mealCategoryList = [];

    final detailResponse = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
    );


    if (detailResponse.statusCode == 200) {
      final detailData = json.decode(detailResponse.body);
      var categories=detailData['categories'];

      for(var i = 0; i < categories.length;i++){
        mealCategoryList.add(MealCategori.fromJson(categories[i]));

      }
    }

    return mealCategoryList;
  }



  Future<List<Meal>> loadMealList(String categori) async {
    List<Meal> mealList = [];

    final detailResponse = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$categori'),
    );


    if (detailResponse.statusCode == 200) {
      final detailData = json.decode(detailResponse.body);
      var categories=detailData['meals'];

      for(var i = 0; i < categories.length;i++){
        mealList.add(Meal.fromJson(categories[i]));

      }
    }

    return mealList;
  }

}