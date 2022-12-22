import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilities/admob.dart';
import '../../../utilities/model_1.dart';


class FruitsVideos extends StatefulWidget{
  @override
  State<FruitsVideos> createState() => _FruitsVideosState();
}
List<Numbermodel> fruitvideolist = fruitvideo1();
List<String> fruitvideoURLlist = fruitvideoURL();

class _FruitsVideosState extends State<FruitsVideos> {
  Future<void> _launchYoutubeVideo(String url) async {
    await launch(url);
  }
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
        title: Text('Fruit Video Songs',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),),
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
                itemCount: fruitvideolist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.redAccent,
                    onTap: () {
                      _launchYoutubeVideo(fruitvideoURLlist[index]);
                      print(fruitvideoURLlist[index]);
                    },
                    child: Card(
                      color: appColors[Random().nextInt(7)],
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.blue.withOpacity(0.3),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(fruitvideolist[index].image!,fit: BoxFit.fill,alignment: Alignment.topCenter,height: 122),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(fruitvideolist[index].Text!,style: TextStyle(color: Colors.redAccent,fontFamily: "arlrdbd",fontSize: 15),)),
                            )
                          ]
                      ),
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
          ad:AdmobHelper().getBannerAd()..load(),
        ),
      ),
    );
  }
}

