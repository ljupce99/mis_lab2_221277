import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2_221277/models/MealCategor.dart';

class MealCategorysCard extends StatelessWidget{
  final MealCategori mealCategori;
  const MealCategorysCard({super.key,required this.mealCategori});




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/mealcategory", arguments: mealCategori.category);
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
                  child: Image.network(mealCategori.imgThoumb,fit: BoxFit.cover,)
              ),
              Divider(),
              Text(mealCategori.category, style: TextStyle(fontSize: 20)),
              Divider(),
              Text(mealCategori.opis, style: TextStyle(fontSize: 12)),

            ],
          ),
        ),
      ),
    );

  }}

