import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Alphabets.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Animals.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Brids.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Colors.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Flowers.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Fruits.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Months.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Numbers.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Shapes.dart';
import 'package:kidslearning/ui/main%20pages/listen%20and%20guess/guess_Vegitables.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/numbers_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Alphabet.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Animals.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Brids.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Colors.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Flowers.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Fruit.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Month.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Number.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Shapes.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Vegitable.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/alphabets_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/animals_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/birds_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/colors_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/flowers_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/fruits_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/months_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/numbers_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/shapes_Videos.dart';
import 'package:kidslearning/ui/main%20pages/video%20learning/vegitables_Videos.dart';

import 'ui/main pages/look and chooes/alphabets_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/animals_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/birds_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/colors_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/flowers_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/fruits_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/months_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/shapes_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/vegitables_Quiz.dart';

class MyList{
 //  String? data;
 //
 //
 // Widget get myfun{
 //    return Text("da");
 //  }

  List Pages = [
    LearningAlphabet(),
    LearningNumbers(),
    LearningColor(),
    LearningShapes(),
    LearningAnimal(),
    LearningBrids(),
    LearningFlower(),
    LearningFruits(),
    LearningMonth(),
    LearningVegitable(),
  ];
  List videoPages = [
    AlphabetsVideos(),
    NumbersVideos(),
    ColorsVideos(),
    ShapesVideos(),
    AnimalsVideos(),
    BirdsVideos(),
    FlowersVideos(),
    FruitsVideos(),
    MonthsVideos(),
    VegitablesVideos(),
  ];

  List quizPages = [
    AlphabetsQuiz(),
    NumbersQuiz(),
    ColorQuiz(),
    ShapesQuiz(),
    AnimalsQuiz(),
    BirdsQuiz(),
    FlowersQuiz(),
    FruitsQuiz(),
    MonthsQuiz(),
    VegitablesQuiz(),

  ];

  List guessPages = [
    GuessAlphabets(),
    GuessNumbers(),
    GuessColors(),
    GuessShapes(),
    GuessAnimals(),
    GuessBirds(),
    GuessFlowers(),
    GuessFruits(),
    GuessMonths(),
    GuessVegitables()
  ];


  List images = [
    'assets/images/Alphabet.png',
    'assets/images/Numbers.png',
    'assets/images/Color.png',
    'assets/images/Shapes.png',
    'assets/images/Animals.png',
    'assets/images/Birds.png',
    'assets/images/Flowers.png',
    'assets/images/Fruit.png',
    'assets/images/Month.png',
    'assets/images/Vegitable.png',
  ];

  List mynames = [
    'Alphabet',
    'Number',
    'Color',
    'Shapes',
    'Animal',
    'Bird',
    'Flower',
    'Fruit',
    'Month',
    'Vegitable',
  ];


  Widget myInkwell({ var nextPage, String? nImage, String? nName, int? h, BuildContext? context}) {
    return InkWell(
      onTap: (){
        Navigator.push(context!,MaterialPageRoute(builder: (context)=>nextPage));
      },
      child: Container(
        height: h == 1 ? 50 : 1000,
        decoration: BoxDecoration(
          color: h == 2 ?  Colors.black: Colors.orange[50],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(nImage!,height: 90,),
            Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[100]
                ),
                child: Center(child: Text(nName!,style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
          ],
        ),
      ),
    );
  }

  // MyList({this.data});
}