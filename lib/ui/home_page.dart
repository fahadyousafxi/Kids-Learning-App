import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidslearning/ui/main%20pages/look_and_chooes.dart';
import 'package:kidslearning/ui/main%20pages/start_learning.dart';
import 'package:kidslearning/ui/main%20pages/video_learning.dart';
import 'package:get/get.dart';
import 'package:kidslearning/ui/privacy_policy.dart';
import 'package:kidslearning/ui/settings.dart';
import '../utilities/admob.dart';
import 'main pages/listen_and_guess.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String url = "https://play.google.com/store/apps/details?id=" + "com.example.kids";
  late int index;
  AdmobHelper admobHelper =  new AdmobHelper();
  @override
  void initState() {
    super.initState();
    admobHelper.createInterad();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<bool> showExitPopup() async {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App',style: TextStyle(color: Colors.black,fontSize: 30),),
          content: Text('Do you want to exit an App?',style: TextStyle(color: Colors.black,fontSize: 20),),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child:Text('No'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child:Text('Yes'),
            ),
          ],
        ),
      )??false;
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: OverflowBar(
          children: [
            WillPopScope(
              onWillPop: showExitPopup,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(onPressed: (){
                      Get.to(const Settings());
                    }, icon: Icon(Icons.settings,color: Colors.black,),),
                    IconButton(onPressed: (){
                      Get.to(PrivacyPolicy());
                    }, icon: Icon(Icons.policy_outlined,color: Colors.black),),
                  ],

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
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height:size.height*0.3,
                            child:  Container(
                                height: size.height * 0.3 - 27,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36),bottomRight: Radius.circular(36))),
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(top: 60,left: 8,right: 8,bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/sun.png"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Good",
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontFamily: "arlrdbd",
                                              color: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Morning!",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: "arlrdbd",
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                      children: [
                                        InkWell(


                                          onTap: (){
                                            admobHelper.showInterad();
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>StartLearning()));
                                          },
                                          child: Container(
                                            height: 144,
                                            width: 144,
                                            decoration: BoxDecoration(
                                              color:  Colors.green.withOpacity(0.2),//Color(0xFFE4F2E6),
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/images/number.png",height: 90,),
                                                Text('Lets Start Learning',style: TextStyle(fontFamily: "arlrdbd",color: Color(0xFF6DB072)),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            admobHelper.showInterad();
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>VideoLearning()));
                                          },
                                          child: Container(
                                            height: 211,
                                            width: 144,
                                            decoration: BoxDecoration(
                                              color: Colors.orangeAccent.withOpacity(0.3),//Color(0xFFFFF9F4),
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/images/video.png",height: 90,),
                                                Text('Video Learning',style: TextStyle(fontFamily: "arlrdbd",color: Color(0xFFEC9E4E)),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            admobHelper.showInterad();
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>ChooesAndLook()));
                                          },
                                          child: Container(
                                            height: 211,
                                            width: 155,
                                            decoration: BoxDecoration(
                                              color: Colors.tealAccent.withOpacity(0.4),//Color(0xFFFEF9E4),
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/images/apple.png",height: 90,),
                                                Text('Look And Choose',style: TextStyle(fontFamily: "arlrdbd",color: Colors.teal),),//Color(0xFFF2CC2B)),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            admobHelper.showInterad();
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>ListenGuess()));
                                          },
                                          child: Container(
                                            height: 144,
                                            width: 155,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEBE8FD),
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/images/lione.png",height: 90,),
                                                Text('Listen and Guess',style: TextStyle(fontFamily: "arlrdbd",color: Color(0xFF8770E4)),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}
