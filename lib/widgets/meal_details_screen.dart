import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routeName = "/meal-details";
  final Function setFavourite;
  final Function isFavourite;

  MealDetails(this.setFavourite, this.isFavourite);

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(BuildContext context, Widget child) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    Map mealDetails = ModalRoute.of(context).settings.arguments as Map;
    String title = mealDetails['title'];
    String imageUrl = mealDetails['imageUrl'];
    List<String> ingredients = mealDetails['ingredients'];
    List<String> steps = mealDetails['steps'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(imageUrl),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ingredients[index]),
                    ),
                  );
                },
                itemCount: ingredients.length,
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(steps[index]),
                      ),
                      Divider(thickness: 2,),
                    ],
                  );
                },
                itemCount: steps.length,
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: (isFavourite(mealDetails['id']) == true) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () => setFavourite(mealDetails['id']),
      ),
    );
  }
}
