import 'package:flutter/material.dart';
import './catergory_item.dart';
import '../dummy_data.dart';

class CaterogiesScreen extends StatelessWidget {
  static const routeName = "/";

  
  @override
  Widget build(BuildContext context) {
    return GridView(
            padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((item) => CategoryItem(category: item,)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        )
    );
  }
}
