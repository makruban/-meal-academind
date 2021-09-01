import 'package:flutter/material.dart';
import 'package:meals_academind/dummy_data.dart';
import 'package:meals_academind/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen({required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) =>
        meal.categories.contains(categoryId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) =>
            MealItem(id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability),),
    );
  }
}
