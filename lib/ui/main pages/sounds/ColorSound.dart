import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../utilities/model_1.dart';


class ColorSound extends StatefulWidget {
  int index ;

  ColorSound( this.index);
  @override
  State<ColorSound> createState() => _ColorSoundState();
}
List<Numbermodel> colorlist =COLOR1();
class _ColorSoundState extends State<ColorSound> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    int i=0;
    Future _speak() async{

      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-IN");
      await flutterTts.setPitch(1.0);
      await flutterTts.setVolume(10.0);
      print(await flutterTts.getVoices);
      int count = widget.index;

      await flutterTts.speak(colorlist[count].Text!);

    }
    final _controller = new PageController();

    return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            title: Text('Color',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),
              ),
            backgroundColor: Colors.transparent,
          ),
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
                height: 650,
                width: 500,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     fit: BoxFit.fitHeight,
                  //     image: AssetImage("assets/images/Union 12.png")
                  // ),
                ),
                child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Card(
                              margin: EdgeInsets.all(20),
                              elevation: 5,
                              shadowColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: PageView.builder(
                                controller: _controller,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:colorlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(height: 1,),
                                          Image.asset(colorlist[widget.index].image!,alignment: Alignment.topCenter,),
                                          Text(colorlist[widget.index].Text.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          Container(height: 1,),
                                        ],
                                      ),
                                      );
                                  },
                              ),
                            ),
                          ),
                          // Image.asset('assets/images/AtoZ/A.png',height: 200),
                          Column(
                              children: [
                                InkWell(
                                    onTap: ()=> _speak(),
                                    child: Image.asset('assets/images/11MaskGroup3.png')),
                                Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Align(
                                    heightFactor: 0.5,
                                    child: Center(

                                          child: ListTile(
                                            trailing: InkWell(
                                              onTap: (){

                                                if(widget.index>=0 && widget.index<11){
                                                  i++;
                                                  print(widget.index);
                                                  setState(() {
                                                    widget.index++;
                                                  });
                                                }
                                                _speak();
                                                // changeImage(count);
                                              },
                                              child: Image(
                                                image: AssetImage('assets/images/11MaskGroup5.png'),
                                              ),
                                            ),

                                            leading: InkWell(
                                              onTap: (){
                                                if(widget.index>0 && widget.index<=11){
                                                  i--;
                                                  setState(() {
                                                    widget.index--;
                                                  });
                                                }
                                                _speak();
                                              },
                                              child: Image(
                                                image: AssetImage('assets/images/11MaskGroup4.png'),

                                              ),
                                            ),

                                          ),
                                        ),
                                  ),
                                )
                              ]
                          )
                        ]
                    )
                ),
              ),
            ],
          )
    );
  }
}

