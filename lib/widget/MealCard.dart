import 'package:flutter/material.dart';
import 'package:mis_lab2_221277/models/Meal.dart';

class MealCard extends StatelessWidget{
  final Meal meal;
  const MealCard({super.key,required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/mealdetails", arguments: meal.id.toString());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red.shade300, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Image.network(meal.mealThumb,fit: BoxFit.cover,)
              ),
              Divider(),
              Text(meal.name, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );

  }

}
