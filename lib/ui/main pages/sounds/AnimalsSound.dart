import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../utilities/model_1.dart';


class AnimalSound extends StatefulWidget {
  int index1 ;

  AnimalSound( this.index1);
  @override
  State<AnimalSound> createState() => _AnimalSoundState();
}
List<Numbermodel> animallist = ANIMAL1();

class _AnimalSoundState extends State<AnimalSound> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    int i=0;
    Future _speak() async{
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setVolume(10.0);
      print(await flutterTts.getVoices);
      int count = widget.index1;

      await flutterTts.speak(animallist[count].Text!);
    }
    final _controller = new PageController();

    return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,

            title: Text(
                'Animal',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),
            ),
            backgroundColor: Colors.transparent,
          ),
          // extendBodyBehindAppBar: true,
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
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //       fit: BoxFit.fitHeight,
                //       image: AssetImage("assets/images/Union 12.png")
                //   ),
                // ),
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
                                itemCount:animallist.length,
                                itemBuilder: (BuildContext context, int index1) {
                                  return Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(height: 1,),
                                          Image.asset(animallist[widget.index1].image!,alignment: Alignment.topCenter, height: 300,),

                                          Text(animallist[widget.index1].Text.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          Container(height: 1,),

                                        ],
                                      ),

                                  );
                                },
                              ),
                            ),
                          ),
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
                                                if(widget.index1>=0 && widget.index1<13){
                                                  i++;
                                                  print(widget.index1);
                                                  setState(() {
                                                    widget.index1++;
                                                  });
                                                }
                                                _speak();
                                              },
                                              child: Image(
                                                image: AssetImage('assets/images/11MaskGroup5.png'),
                                              ),
                                            ),

                                            leading: InkWell(
                                              onTap: (){
                                                if(widget.index1>0 && widget.index1<=13){
                                                  i--;
                                                  setState(() {
                                                    widget.index1--;
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

