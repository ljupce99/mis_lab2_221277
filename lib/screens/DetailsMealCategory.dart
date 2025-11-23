import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2_221277/models/Meal.dart';

import '../service/api_service.dart';
import '../widget/MealGrid.dart';

class MealCategory extends StatefulWidget{
  final String categori;
  const MealCategory({super.key, required this.categori});


  @override
  State<StatefulWidget> createState() => _MealCategory();

}

class _MealCategory extends State<MealCategory>{

  List<Meal> meals =[];
  List<Meal> filteredMeals =[];

  final ApiService _apiService=ApiService();
  bool _isLoading = true;

  @override
  void initState() {
    _loadMealList(widget.categori);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Meals"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              onSubmitted: _searchMeals,
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MealGrid(meals: filteredMeals),
            ),
          ),
        ],
      ),


    );


  }
  void _searchMeals(String search) async{

    if (search.isEmpty) {
      setState(() {
        filteredMeals = meals;
      });
      return;
    }

    final list = await _apiService.searchMealCategoryList(search);

    if (list == null || list.isEmpty) {
      setState(() {
        filteredMeals = [];
      });
    }

    final sameCategory = list
        .where((i) => i.category == widget.categori)
        .toList();

    setState(() {
      filteredMeals = sameCategory;
    });

  }
  void _loadMealList(String categori) async {
    final list = await _apiService.loadMealList(categori);

    setState(() {
      meals = list;
      filteredMeals = list;
      _isLoading = false;

    });
  }
}