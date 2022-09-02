import 'package:flutter/material.dart';
import 'recipe_list.dart';
import 'package:recipe_box/model/food_recipe.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              if (value ==  'List'){
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return const RecipeList();
                }));
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

      body: SingleChildScrollView(
        child: Column(
            children: [
              const SizedBox(height:20),

              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 185,
                          decoration: BoxDecoration(color: Colors.greenAccent[100],),
                          padding: const EdgeInsets.only(bottom: 16),
                          child:Column(
                            children: [
                              const SizedBox(height: 8),
                              const Text(
                                'Memasak',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize: 32),
                              ),
                              const Text(
                                'Lebih Mudah',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize: 32,
                                    color: Colors.grey
                                ),
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ElevatedButton(
                                  style:ElevatedButton.styleFrom(primary: Colors.green[500]),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 60),
                                    child: Text(
                                      'Cook Now !',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'PoppinsSemi',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context){
                                      return const RecipeList();
                                    }));
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ],),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('Featured Recipes',style: TextStyle(fontFamily: 'PoppinsSemi',fontSize: 18),),
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    final FoodRecipe food = foodRecipeList[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Stack(
                        children:[
                          Container(
                            height: 400,
                            width: 230,
                            decoration:
                            const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.black12,blurRadius: 5,offset: Offset(8,5))]
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(food.imagePotrait,fit: BoxFit.cover,)),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.bottomLeft,
                                child:
                                Text(
                                  food.name,
                                  style: const TextStyle(color: Colors.white,fontSize: 24,fontFamily: 'PoppinsSemi'),
                                )
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                children: [
                                  const Icon(Icons.favorite_border,color: Colors.white,),
                                  const SizedBox(width:2 ,),
                                  Text(food.favoriteNumber,style: const TextStyle(color: Colors.white),)
                                ]
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                  itemCount: foodRecipeList.length,
                )
              ),

              const SizedBox(height: 30,),

              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                    padding:EdgeInsets.symmetric(horizontal: 16),
                                    child: Icon(Icons.facebook,size: 30,)
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Icon(Icons.email_outlined,size: 30,),
                                ),

                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Icon(Icons.discord,size: 30,),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('About Us'),
                              Text('Blogs'),
                              Text('Terms'),
                              Text('Proccess'),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
      ),
    );
  }


}