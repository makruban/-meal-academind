import 'package:flutter/material.dart';
import 'package:meals_academind/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool)? updateValue,) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      onChanged: updateValue,
      value: currentValue,
      subtitle: Text(
        description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      'Gluten-free', 'Only include gluten-free meals',
                      _glutenFree, (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      },);},),
                  _buildSwitchListTile(
                    'Lactose-free', 'Only include lactose-free meals',
                    _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    },);},),

                  _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals',
                    _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    },);},),

                  _buildSwitchListTile(
                    'Vegan', 'Only include vegan-free meals',
                    _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    },);},),                ],

              ),),
          ],
        ));
  }
}
