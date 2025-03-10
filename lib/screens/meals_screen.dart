import 'package:app04/screens/meal_detail_screen.dart';
import 'package:app04/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: meals
              .map((meal) => MealItem(
                    meal: meal,
                    onSelectMeal: (Meal meal) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => MealDetailScreen(
                            meal: meal,
                          ),
                        ),
                      );
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
