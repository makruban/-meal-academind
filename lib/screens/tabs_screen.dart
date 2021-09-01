import 'package:flutter/material.dart';
import 'package:meals_academind/screens/categories_screen.dart';
import 'package:meals_academind/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = '/tabs_screen';


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  void _selectPage(int index){

  }  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
        ),
        body:null,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage ,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'Categories',),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites',),
          ],
        ),
      ),
    );
  }
}
