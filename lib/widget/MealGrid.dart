import 'package:flutter/cupertino.dart';
import 'package:mis_lab2_221277/models/Meal.dart';

import 'MealCard.dart';

class MealGrid extends StatefulWidget{
  final List<Meal> meals;
  const MealGrid({super.key,required this.meals});

  @override
  State<StatefulWidget> createState() => _MealGrid();

}
class _MealGrid extends State<MealGrid>{


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.meals.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return MealCard(meal: widget.meals[index]);
      },
    );

  }

}

