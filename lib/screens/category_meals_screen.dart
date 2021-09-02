import 'package:flutter/material.dart';
import 'package:meals_academind/dummy_data.dart';
import 'package:meals_academind/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute
          .of(context)!
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal) =>
          meal.categories.contains(categoryId)).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
        ),
      ),
      body: ListView.builder(
        itemCount: displayedMeals!.length,
        itemBuilder: (ctx, index) =>
            MealItem(id: displayedMeals![index].id,
                title: displayedMeals![index].title,
                imageUrl: displayedMeals![index].imageUrl,
                duration: displayedMeals![index].duration,
                complexity: displayedMeals![index].complexity,
                affordability: displayedMeals![index].affordability,
            removeItem: _removeMeal,),),
    );
  }
}
