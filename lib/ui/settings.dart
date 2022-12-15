import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:kidslearning/ui/privacy_policy.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final flutterWebviewPlugin = new PrivacyPolicy();

  _openMap() async {
    // const url =  "https://play.google.com/store/apps/details?id=" + "com.example.kids";
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
  _Share() async{
    FlutterShare.share(title: 'SHare',linkUrl: "https://play.google.com/store/apps/details?id=" + "codeprisma.preschool.learningapp.academy");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,  //Color(0xFFFEF7F0),
        elevation: 0,
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
            child: Column(
              children: [
                SizedBox(height: 60,),
                Container(
                  height:size.height*0.3,
                  child:  Stack(
                    children: [
                      Container(
                          height: size.height * 0.3 - 27,
                          decoration: const BoxDecoration(
                              color: Colors.transparent,//Color(0xFFFEF7F0),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36),bottomRight: Radius.circular(36))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                          color: Color(0xFFF19335),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      return  _openMap();
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.purpleAccent.withOpacity(0.3), //Color(0xFFE4F2E6),
                          borderRadius: BorderRadius.circular(10)),
                      height: 80,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Rate Us',
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                            style: TextStyle(
                              color: Colors.purple, //Color(0xFF5EA763),
                              fontWeight: FontWeight.bold,
                              fontFamily: "arlrdbd",fontSize: 20,),
                            textAlign: TextAlign.left,),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      return _Share();
                    },
                    splashColor: Color(0xFFF2CF37),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.tealAccent.withOpacity(0.3),  //Color(0xFFFEF9E4),
                          borderRadius: BorderRadius.circular(10)),
                      height: 80,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Share',
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                            style: TextStyle(
                              color: Colors.teal,  //Color(0xFFF2CF37),
                              fontWeight: FontWeight.bold,
                              fontFamily: "arlrdbd",fontSize: 20,),
                            textAlign: TextAlign.left,),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



