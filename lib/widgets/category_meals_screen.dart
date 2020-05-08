import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> avalableMeals;

  CategoryMeals(this.avalableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  List<Meal> mealsToShow = [];
  String categoryTitle;
  String categoryId;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      Map routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      categoryId = routeArgs['id'];
      mealsToShow = widget.avalableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      mealsToShow.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: mealsToShow[index].id,
            title: mealsToShow[index].title,
            imageUrl: mealsToShow[index].imageUrl,
            affordability: mealsToShow[index].affordability,
            complexity: mealsToShow[index].complexity,
            duration: mealsToShow[index].duration,
            ingredients: mealsToShow[index].ingredients,
            steps: mealsToShow[index].steps,
            removeMeal: _removeMeal,
          );
        },
        itemCount: mealsToShow.length,
      ),
    );
  }
}
