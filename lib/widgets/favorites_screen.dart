import 'package:flutter/material.dart';
import 'package:mealsapp/models/meals.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouritedMeals;
  FavoritesScreen(this.favouritedMeals);
  @override
  Widget build(BuildContext context) {
    return favouritedMeals.length > 0
        ? ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
        title: favouritedMeals[index].title,
        id: favouritedMeals[index].id,
        affordability: favouritedMeals[index].affordability,
        complexity: favouritedMeals[index].complexity,
        duration: favouritedMeals[index].duration,
        imageUrl: favouritedMeals[index].imageUrl,
        ingredients: favouritedMeals[index].ingredients,
        steps: favouritedMeals[index].steps,
        removeMeal: () {},
                );
              },
              itemCount: favouritedMeals.length,
            )
        : Center(
            child: Text('No favourite meals added'),
          );
  }
}
