import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2_221277/models/MealCategor.dart';
import 'package:mis_lab2_221277/service/api_service.dart';

import '../widget/MealCategorysGrid.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {




  late final List<MealCategori> mealscategorys;
  final ApiService _apiService=ApiService();
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _loadMealCategorysList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Meals Categorys"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          TextButton(
              onPressed: rendomMeal,
              child: Text("Get rendom meal",style: TextStyle(fontSize: 14,),)
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MealCategorysGrid(list: mealscategorys),

            ),
          ),

        ],
        
      ),
      


    );


  }
  void rendomMeal() async {
    String idM = await _apiService.getRendomMeal();
    Navigator.pushNamed(context, "/mealdetails", arguments: idM);
  }

  void _loadMealCategorysList() async {
    final list = await _apiService.loadMealCategoryList();

    setState(() {
      mealscategorys= list;
      _isLoading = false;

    });
  }


}