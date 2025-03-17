import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.meal,
      this.duration,
      this.complexity,
      required this.onSelectMeal});

  final Meal meal;
  final int? duration;
  final Complexity? complexity;

  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
    }
  }

  String get durationText {
    return meal.duration.toString();
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxirious';
      case Affordability.pricey:
        return 'Pricey';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl)),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 8),
                      Text('$durationText min',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 16),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 8),
                      Text(complexityText,
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 16),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 8),
                      Text(affordabilityText,
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
