import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:recipe_box/model/food_recipe.dart';

class RecipeList extends StatelessWidget{

  const RecipeList({Key? key}):super(key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: const [
              Text('Recipe',style: TextStyle(fontFamily: "AveriaLibre"),),
              Text('Box',style: TextStyle(color: Colors.green,fontFamily: "AveriaLibre"),)
            ],
          ),
          actions: const [
            Icon(Icons.people_outline,color: Colors.green,size: 30,),
            SizedBox(width: 13,),
            Icon(Icons.favorite_border,color: Colors.green,size: 30,),
            SizedBox(width: 10,)
          ],
          leading: PopupMenuButton<String>(
            onSelected: (value){
              if (value ==  'Home'){
                Navigator.pop(context);
                }
              },
            itemBuilder: (context){
              return[
                const PopupMenuItem(
                    value: 'Home',
                    child: Text('Home')),
                const PopupMenuItem(
                    value: 'List',
                    child: Text('Recipe List'))
              ];},
          )
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8,),

            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap
                  ),
                  child: const Text('Home',style: TextStyle(fontFamily: 'Poppins',fontSize: 12),
                  ),
                  onPressed: (){
                    return Navigator.pop(context);
                  },
                ),
                const Text(' / Recipe List',style: TextStyle(fontFamily: 'PoppinsSemi',fontSize: 12),)
              ],
            ),

            const SizedBox(height: 16,),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: foodRecipeList.map((food) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return DetailPage(food: food,);
                      }));
                    },
                    child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration:
                            const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.black12,
                                      blurRadius: 5,
                                      offset: Offset(8, 5))
                                ]
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  food.imagePotrait, fit: BoxFit.cover,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.bottomLeft,
                                child:
                                Text(
                                  food.name,
                                  style: const TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'PoppinsSemi'),
                                )
                            ),
                          ),
                        ]
                    ),
                  );
                }).toList(),


              ),

            ),




          ],
        ),
      ),
    );
  }

}