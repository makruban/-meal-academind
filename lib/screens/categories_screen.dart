import 'package:flutter/material.dart';
import 'package:meals_academind/widgets/category_item.dart';
import 'package:meals_academind/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  static const String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return
       GridView(
        padding: const EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                title: catData.title,
                color: catData.color,
                id: catData.id,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );

  }
}
