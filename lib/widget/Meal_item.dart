import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/Screens/Details_Meal.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;
   _OnselectMeal(context,Meal meal){
    
Navigator.push(context,MaterialPageRoute(builder: (ctx)=> DetailsMeal(meal: meal)));
  }
  //Make the first character UpperCase 
String get complexityText{
  return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1) ;
}


String get affordabilityText{
  return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1) ;
}
  @override
  Widget build(BuildContext context) {
    
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // It removes any clips from child widget that may go outside
      clipBehavior: Clip.hardEdge,  
      elevation: 3,
      child: InkWell(
        onTap: (){
           _OnselectMeal(context, meal);
        },
        child: Stack(
          children: [
            //The image will be loaded in smooth way
            FadeInImage(
              //Make sure the image never distored but cut of and zoomed in a bit
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
                //It will be place in the top of this image
                bottom: 0, //Stay at the bottom, if I use top :0 it will be in the top 
                left: 0, // Start at the most left
                right:
                    0, // it should be ended before 0 pixels from the image to the right

                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      //TextOverflow.ellipsis means add ... if it is too long
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize:  20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(icon: Icons.schedule, label: "${meal.duration} min")
                          ,   MealItemTrait(icon: Icons.work, label: complexityText),
                           MealItemTrait(icon: Icons.attach_money, label: affordabilityText)
                          ,
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
