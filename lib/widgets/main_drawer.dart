import 'package:flutter/material.dart';
import './filters_screen.dart';
import './categories_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 120,
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text('Cooking up!', style: TextStyle(color: Colors.red, fontSize: 28, fontWeight: FontWeight.w900,),),
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Meals', style: Theme.of(context).textTheme.title),
              onTap: (){Navigator.pushReplacementNamed(context, CaterogiesScreen.routeName);},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Filters',
                style: Theme.of(context).textTheme.title,
              ),
              onTap: (){Navigator.pushNamed(context, FiltersScreen.routeName);},
            )
          ],
        ),
      );
  }
}