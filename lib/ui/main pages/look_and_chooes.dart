
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/alphabets_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/animals_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/birds_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/colors_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/flowers_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/fruits_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/months_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/numbers_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/shapes_Quiz.dart';
import 'package:kidslearning/ui/main%20pages/look%20and%20chooes/vegitables_Quiz.dart';

import '../../mylist.dart';
import '../../utilities/admob.dart';
import '../../utilities/model_1.dart';

class ChooesAndLook extends StatelessWidget{
  int? index;
  ChooesAndLook({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Look And Chooes',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter:  ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child:  Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),)
            ],
          ),
          Column(
            children: [
              Expanded(
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    itemCount: MyList().mynames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                              splashColor: Colors.redAccent,
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyList().quizPages[index]));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: appColors[Random().nextInt(7)],
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 1,),
                                      Image.asset(MyList().images[index],height: 90,),
                                      Container(
                                          height: 45,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.red.withOpacity(0.3)
                                          ),
                                          child: Center(child: Text(MyList().mynames[index],style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                                    ]
                                ),
                              ),
                            ),
                      );

                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(1, index.isEven ? 1 : 1.2);
                    }),








                // child: GridView.count(
                //     padding: EdgeInsets.all(35),
                //     mainAxisSpacing: 15,
                //     crossAxisSpacing: 20,
                //     crossAxisCount: 2,
                //     primary: false,
                //     children: [
                //       InkWell(
                //         splashColor: Colors.redAccent,
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> AlphabetsQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Alphabet.png',height: 90,),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('ABC Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>NumbersQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Numbers.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Number Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> ColorQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Color.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Color Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShapesQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Shapes.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Shape Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> AnimalsQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Animals.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Animal Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> BirdsQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Birds.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Bird Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> FlowersQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Flowers.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Flower Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> FruitsQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Fruit.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Fruit Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> MonthsQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Month.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Month Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> VegitablesQuiz()));
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10.0),
                //             color: Colors.orange[50],
                //           ),
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Image.asset('assets/images/Vegitable.png',height: 90),
                //                 Container(
                //                     height: 45,
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: Colors.orange[100]
                //                     ),
                //                     child: Center(child: Text('Vegetable Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       )
                //     ]
                // ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width *0.13,
        width: 25,
        child: AdWidget(
          ad:AdmobHelper.getBannerAd()..load(),
        ),
      ),
    );
  }









  Widget myInkwell({ required var nextPage, required String? nImage, required String? nName}) {
    return InkWell(
      splashColor: Colors.orange[100],
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.orange[50],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(nImage!,height: 90),
              Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange[100]
                  ),
                  child: Center(child: Text(nName!,style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
            ]
        ),
      ),
    );
  }
}



