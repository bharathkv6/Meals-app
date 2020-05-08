import 'package:flutter/material.dart';
import '../models/meals.dart';
import './main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouritedMeals;
  TabsScreen(this.favouritedMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

//********* Navigation bar at the top ********/

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             onTap: (index) {},
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: <Widget>[
//           CaterogiesScreen(),
//           Favorites(),
//         ],),
//       ),
//     );
//   }
// }
class _TabsScreenState extends State<TabsScreen> {
  int activeTabIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    activeTabIndex = 0;
    pages = [
        CaterogiesScreen(),
        FavoritesScreen(widget.favouritedMeals),
    ];
  }

  void changeTab(index) {
    setState(() {
      activeTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: pages[activeTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => changeTab(index),
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: activeTabIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
