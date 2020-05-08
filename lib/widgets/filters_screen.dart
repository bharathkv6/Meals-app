import 'package:flutter/material.dart';
import './main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function _setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.filters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegetarian;
  bool isVegan;

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.filters['gluten'];
    isLactoseFree = widget.filters['lactose'];
    isVegan = widget.filters['vegan'];
    isVegetarian = widget.filters['vegetarian'];
  }

  void onSwitchChange(value, filter) {
    switch (filter) {
      case "gluten":
        setState(() {
          isGlutenFree = !isGlutenFree;
        });
        break;

      case 'lactose':
        setState(() {
          isLactoseFree = !isLactoseFree;
        });
        break;

      case 'vegan':
        setState(() {
          isVegan = !isVegan;
        });
        break;

      case 'vegetarian':
        setState(() {
          isVegetarian = !isVegetarian;
        });
    }
  }

  Widget _buildListTile(
      String title, String subtitle, bool value, String type) {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(10),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) => onSwitchChange(value, type),
    );
  }

  void saveFilters(){
    Map<String, bool> filtersData = {
      "gluten": isGlutenFree,
      "lactose": isLactoseFree,
      "vegan": isVegan,
      "vegetarian": isVegetarian,
    };
    widget._setFilters(filtersData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),onPressed: saveFilters,)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.topCenter,
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildListTile('Gluten-free', 'Only include gluten-free meal',
                    isGlutenFree, 'gluten'),
                _buildListTile('Lactose-free', 'Only include lactose-free meal',
                    isLactoseFree, 'lactose'),
                _buildListTile('Vegetarian', 'Only include vegetarian meal',
                    isVegetarian, 'vegetarian'),
                _buildListTile(
                    'Vegan', 'Only include vegan meal', isVegan, 'vegan'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
