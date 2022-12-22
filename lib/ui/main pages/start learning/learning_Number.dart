import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../utilities/admob.dart';
import '../../../utilities/model_1.dart';
import '../sounds/NumberSound.dart';

class LearningNumbers extends StatefulWidget {
  @override
  State<LearningNumbers> createState() => _LearningNumbersState();
}

List<Numbermodel> list = NumberList();

class _LearningNumbersState extends State<LearningNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Number',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),),
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
            Container(
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(22),
                          splashColor: Colors.redAccent,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NumberSound(index),
                                ));print(index);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Card(
                              color: appColors[Random().nextInt(7)],
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.blue,
                              child: Container(
                                color: appColors[Random().nextInt(7)],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            list[index].image!,
                                            fit: BoxFit.fill,
                                            height:
                                            MediaQuery.of(context).size.width * 0.2,
                                            width:
                                            MediaQuery.of(context).size.width * 0.2,
                                          ),
                                          Image.asset(
                                            list[index].image2!,
                                            fit: BoxFit.fill,
                                            height:
                                            MediaQuery.of(context).size.width * 0.2,
                                            width:
                                            MediaQuery.of(context).size.width * 0.2,
                                          ),
                                        ]),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            list[index].Text!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "arlrdbd",
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));

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
          ad:AdmobHelper().getBannerAd()..load(),
        ),
      ),
        );
  }
}
