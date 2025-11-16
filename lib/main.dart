import 'package:flutter/material.dart';
import 'package:mis_lab2_221277/screens/DetailsMealCategory.dart';
import 'package:mis_lab2_221277/screens/HomeMeal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lab2_221277',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/mealcategory": (context) {
          final category = ModalRoute.of(context)!.settings.arguments as String;
          return MealCategory(categori: category);
        },

      },
    );
  }
}


