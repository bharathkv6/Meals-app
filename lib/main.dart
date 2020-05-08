import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meals.dart';
import './widgets/tabs_screen.dart';
import './widgets/meal_details_screen.dart';
import './widgets/category_meals_screen.dart';
import './widgets/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoritedMeals = [];

  void setFavouriteMeals(String id){
    int index = favoritedMeals.indexWhere((meal) => meal.id == id);
    if(index >= 0){
      setState(() {
        favoritedMeals.removeAt(index);
      });
    }else{
      setState(() {
        favoritedMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == id),
        );
      });
    }
  }

  bool isFavourite(id){
    return favoritedMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      print(filterData);
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal){
        if(filters['gluten'] && !meal.isGlutenFree){
          return false;
        }

        if(filters['lactose'] && !meal.isLactoseFree){
          return false;
        }

        if(filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }

        if(filters['vegan'] && !meal.isVegan){
          return false;
        }
        
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoritedMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(availableMeals),
        MealDetails.routeName: (ctx) => MealDetails(setFavouriteMeals, isFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, _setFilters),
      },
    );
  }
}
