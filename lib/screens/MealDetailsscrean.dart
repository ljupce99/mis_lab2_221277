import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab2_221277/models/Meal.dart';
import 'package:mis_lab2_221277/models/MealDetails.dart';

import '../service/api_service.dart';
import '../widget/MealGrid.dart';

class MealDetailsscrean extends StatefulWidget{
  final String id;
  const MealDetailsscrean({super.key, required this.id});


  @override
  State<StatefulWidget> createState() => _MealDetailsscrean();

}

class _MealDetailsscrean extends State<MealDetailsscrean>{

  late MealDetails meal;

  final ApiService _apiService=ApiService();
  bool _isLoading = true;

  @override
  void initState() {
    _loadMeal(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Meal"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
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
                    SizedBox(height: 12),
                    Text(
                      meal.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),

                    GestureDetector(
                      // onTap: () async {
                      //   final url = Uri.parse(meal.videoLink);
                      //   if (await canLaunchUrl(url)) {
                      //     await launchUrl(url);
                      //   }
                      // },
                      child: Text(
                        meal.videoLink,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    Divider(height: 25),

                    Text(
                      "Состојки:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    ...meal.sostojki.map((s) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "--> $s <--",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),

                    Divider(height: 25),
                    Text(meal.instructinon, style: TextStyle(fontSize: 14)),

                  ],
                ),
              ),
            ),
          )
        ],

      ),


    );


  }

  void _loadMeal(String id) async {
    final m = await _apiService.getMealDetails(id);

    setState(() {
      meal=m;
      _isLoading = false;

    });
  }
}