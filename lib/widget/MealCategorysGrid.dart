import 'package:flutter/cupertino.dart';
import 'package:mis_lab2_221277/models/MealCategor.dart';

import 'MealCategorysCard.dart';

class MealCategorysGrid extends StatefulWidget {
  final List<MealCategori> list;
  const MealCategorysGrid({super.key,required this.list});

  @override
  State<MealCategorysGrid> createState() =>_MealCategorysGrid();
}



class _MealCategorysGrid extends State<MealCategorysGrid>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return MealCategorysCard(mealCategori: widget.list[index]);
      },
    );
  }




}