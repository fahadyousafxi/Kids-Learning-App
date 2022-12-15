import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kidslearning/ui/main%20pages/sounds/Alphasound.dart';

import '../../../utilities/admob.dart';
import '../../../utilities/model_1.dart';




class LearningAlphabet extends StatefulWidget{

  @override
  State<LearningAlphabet> createState() => _LearningAlphabetState();
}
List<Numbermodel> kidslist = KidsList1();

class _LearningAlphabetState extends State<LearningAlphabet> {


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text('Alphabet',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),),
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
           child: StaggeredGridView.countBuilder(
               crossAxisCount: 2,
               crossAxisSpacing: 0,
               mainAxisSpacing: 0,
               itemCount: kidslist.length,
               itemBuilder: (context, index) {
                 return InkWell(
                   borderRadius: BorderRadius.circular(22),
                   splashColor: Colors.redAccent,
                   onTap: (){
                     print(kidslist);
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>AlphaSound(index),
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
                       child: Center(
                         child: Image.asset(kidslist[index].image!,height: 120,),
                       )
                   ),
                 );

               },
               staggeredTileBuilder: (index) {
                 return new StaggeredTile.count(1, index.isEven ? 1 : 1.2);
               }),
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

