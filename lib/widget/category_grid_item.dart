import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    //I can have a feedback with inkwell sowe use it instead of gestruedetector 
    return InkWell(
      onTap: () {
        
      }, splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: EdgeInsets.all(16),
        margin:EdgeInsets.all(10),
        decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),

            gradient: LinearGradient(colors: [
          category.color.withOpacity(0.5),
          category.color.withOpacity(0.9)
        ], begin: Alignment.topCenter, end: Alignment.topCenter)),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
