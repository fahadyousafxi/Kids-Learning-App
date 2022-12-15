import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../mylist.dart';
import '../../utilities/admob.dart';
import '../../utilities/model_1.dart';

class VideoLearning extends StatefulWidget{
  @override
  State<VideoLearning> createState() => _VideoLearningState();
}

class _VideoLearningState extends State<VideoLearning> {
  AdmobHelper admobHelper =  new AdmobHelper();

  void initState() {
    super.initState();
    admobHelper.createInterad();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Video Learning',style: TextStyle(color: Color(0xFF000000),fontFamily: "arlrdbd"),),
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
                                admobHelper.showInterad();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyList().videoPages[index]));
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
















                // GridView.count(
                //     padding: EdgeInsets.all(35),
                //     mainAxisSpacing: 15,
                //     crossAxisSpacing: 20,
                //     crossAxisCount: 2,
                //     primary: false,
                //     children: [
                //       InkWell(
                //
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           // admobHelper.showInterad();
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> AlphabetsVideos()));
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
                //                     child: Center(child: Text('ABC Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           // admobHelper.showInterad();
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>NumbersVideos()));
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
                //                     child: Center(child: Text('Number Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //            ),
                //          ),
                //        ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> ColorsVideos()));
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
                //                     child: Center(child: Text('Color Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //             ),
                //           ),
                //        ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           // admobHelper.showInterad();
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShapesVideos()));
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
                //                     child: Center(child: Text('Shape Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           // admobHelper.showInterad();
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> AnimalsVideos()));
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
                //                     child: Center(child: Text('Animal Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //            ),
                //          ),
                //        ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> BirdsVideos()));
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
                //                     child: Center(child: Text('Bird Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //            ),
                //          ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> FlowersVideos()));
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
                //                     child: Center(child: Text('Flower Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //            ),
                //          ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           // admobHelper.showInterad();
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> FruitsVideos()));
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
                //                     child: Center(child: Text('Fruit Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //            ),
                //          ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> MonthsVideos()));
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
                //                     child: Center(child: Text('Month Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //            ),
                //         ),
                //       ),
                //       InkWell(
                //         splashColor: Colors.orange[100],
                //         onTap: (){
                //           // admobHelper.showInterad();
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=> VegitablesVideos()));
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
                //                     child: Center(child: Text('Vegetable Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                //            ),
                //          ),
                //        )
                //      ]
                //   ),
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
}



