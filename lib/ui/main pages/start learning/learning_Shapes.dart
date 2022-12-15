import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../utilities/admob.dart';
import '../../../utilities/model_1.dart';
import '../sounds/ShapeSound.dart';


class LearningShapes extends StatefulWidget{
  @override
  State<LearningShapes> createState() => _LearningShapesState();
}
List<Numbermodel> shapelist = SHAPE1();
class _LearningShapesState extends State<LearningShapes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Shape',style: TextStyle( color: Colors.black,fontFamily: "arlrdbd"),),
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    itemCount: shapelist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(22),
                          splashColor: Colors.redAccent,
                          onTap: (){
                            print(shapelist);
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>ShapeSound(index),
                            ));
                          },
                          child: Card(
                            color: appColors[Random().nextInt(7)],
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            shadowColor: Colors.blue,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(shapelist[index].image!,height: 120,),
                                  Text(shapelist[index].Text!, style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),)
                                ]
                            ),
                          )
                      );

                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(1, index.isEven ? 1 : 1.2);
                    }),



              ),
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
}

