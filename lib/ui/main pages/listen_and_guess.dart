

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kidslearning/utilities/model_1.dart';
import '../../mylist.dart';
import '../../utilities/admob.dart';

class ListenGuess extends StatefulWidget{
  @override
  State<ListenGuess> createState() => _ListenGuessState();
}
class _ListenGuessState extends State<ListenGuess> {
  int?  index;

  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Listen And Guess',style: TextStyle( color: Colors.black,fontFamily: "arlrdbd"),),
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
                          splashColor: Colors.orange[100],
                          onTap: (){
                            flutterTts.speak(MyList().mynames[index]);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyList().guessPages[index]));
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
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.red.withOpacity(0.4)
                                      ),
                                      child: Center(child: Text(MyList().mynames[index],style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
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
                //     children: [
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('Apple');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessAlphabets()));
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
                //                     child: Center(child: Text('Alphabet',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('Zero');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>GuessNumbers()));
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
                //                     child: Center(child: Text('Number',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                //               ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('AQUA');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessColors()));
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
                //                     child: Center(child: Text('Color',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('ARROW');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessShapes()));
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
                //                     child: Center(child: Text('Shape',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('BEER');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessAnimals()));
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
                //                     child: Center(child: Text('Animal',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('ARARAT');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessBirds()));
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
                //                     child: Center(child: Text('Bird',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('BLACK ROSE');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessFlowers()));
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
                //                     child: Center(child: Text('Flower',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('APPLE');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessFruits()));
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
                //                     child: Center(child: Text('Fruit',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('JANUARY');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessMonths()));
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
                //                     child: Center(child: Text('Month',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           flutterTts.speak('BELL PEPPER');
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessVegitables()));
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
                //                     child: Center(child: Text('Vegetable',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
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
          ad:AdmobHelper().getBannerAd()..load(),
        ),
      ),
    );
  }









  Widget myInkwell({ required var nextPage, required String? txt, required String? nImage, required String? nName}) {
    return InkWell(
      splashColor: Colors.orange[100],
      onTap: (){
        flutterTts.speak(txt!);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>nextPage()));
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



