import 'package:flutter/material.dart';
import '../models/meals.dart';
import './meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;
  final Function removeMeal;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.ingredients,
    @required this.steps,
    @required this.removeMeal
  });

  String get complexityString {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'unknown';
    }
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'unknown';
    }
  }

  void selectMeal(context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
    }).then((mealId){
      removeMeal(mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: Color.fromRGBO(27, 23, 23, 0.7),
                    alignment: Alignment.center,
                    width: 250,
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      Text(complexityString),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(affordabilityString),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
