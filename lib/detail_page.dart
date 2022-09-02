import 'package:flutter/material.dart';
import 'package:recipe_box/model/food_recipe.dart';

class DetailPage extends StatelessWidget{
  final FoodRecipe food;

  const DetailPage({Key? key,required this.food}):super(key: key);

  @override
  Widget build(BuildContext context){

    var semi = const TextStyle(fontFamily: 'PoppinsSemi',fontSize: 18);
    var regular = const TextStyle(fontFamily: 'Poppins',fontSize: 12);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(
                height: 310,
                child: Stack(
                  children:[
                    Image.asset(food.imageLandscape,fit: BoxFit.cover,width: double.infinity,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const FavoriteButton(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(food.favoriteNumber,style: const TextStyle(color: Colors.white,fontSize: 16),),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8 ),
                              child: Icon(Icons.share_outlined,color: Colors.white,size: 30,),
                            ),
                          ],
                        ),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.bottomLeft,
                          child:
                          Text(
                            food.name,
                            style: const TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'PoppinsSemi'),
                          )
                      ),
                    ),
                  ]
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                child: Text('Ingredients:',style: semi,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  food.ingredients,
                  style: regular,textAlign: TextAlign.justify,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                child: Text('Cooking Time:',style: semi,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 10,),
                    Text(food.cookingTime,style: regular,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                child: Text('Nutrition Information:',style: semi,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.green,width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: const [
                            Text('CAL',style: TextStyle(color: Colors.grey,fontFamily: 'Poppins',fontSize: 10),),
                            Text('163',style: TextStyle(color: Colors.green,fontFamily: 'PoppinsSemi',fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.green,width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: const [
                            Text('FAT',style: TextStyle(color: Colors.grey,fontFamily: 'Poppins',fontSize: 10),),
                            Text('2,3',style: TextStyle(color: Colors.green,fontFamily: 'PoppinsSemi',fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.green,width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: const [
                            Text('CARB',style: TextStyle(color: Colors.grey,fontFamily: 'Poppins',fontSize: 10),),
                            Text('31',style: TextStyle(color: Colors.green,fontFamily: 'PoppinsSemi',fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.green,width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: const [
                            Text('PROT',style: TextStyle(color: Colors.grey,fontFamily: 'Poppins',fontSize: 10),),
                            Text('4,7',style: TextStyle(color: Colors.green,fontFamily: 'PoppinsSemi',fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20,),

              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal:100),
                      child: Text(
                        'Start Cooking !',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PoppinsSemi',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onPressed: (){},
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  const FavoriteButton({Key?key}):super(key: key);

  @override
  State <FavoriteButton> createState()=> _FavoriteButtonState();
}

class _FavoriteButtonState extends State <FavoriteButton>{
  bool isFavorite = false;

  @override
  Widget build (BuildContext context){
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border ,
        color: Colors.green,size: 30,
      ),
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}