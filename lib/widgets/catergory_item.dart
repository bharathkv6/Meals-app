import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({@required this.category});

  void selectCategory(context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMeals(
    //     categoryId: category.id,
    //     categoryTitle: category.title,
    //   );
    // }));
    Navigator.of(context).pushNamed(
      CategoryMeals.routeName,
      arguments: {
        'id': category.id,
        'title': category.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        key: ValueKey(category.id),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
