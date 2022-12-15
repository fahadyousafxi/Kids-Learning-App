import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../utilities/model_1.dart';


class NumberSound extends StatefulWidget {
  int index1;
  NumberSound( this.index1);
  @override
  State<NumberSound> createState() => _NumberSoundState();
}
class _NumberSoundState extends State<NumberSound> {
  final FlutterTts flutterTts = FlutterTts();
  List<Numbermodel> list = NumberList();
  @override
  Widget build(BuildContext context) {
    Future _speak() async{
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setVolume(10.0);
      print(await flutterTts.getVoices);
      int count = widget.index1;
      await flutterTts.speak( list[count].Text!);
    }
    final _controller = new PageController();
    return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text(
                'Number',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                itemCount:list.length,
                                itemBuilder: (BuildContext context, int index1) {
                                  return  Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          list[widget.index1].image!,
                                          fit: BoxFit.fill,
                                          height:
                                          MediaQuery.of(context).size.width * 0.3,
                                          width:
                                          MediaQuery.of(context).size.width * 0.3,
                                        ),
                                        Image.asset(
                                          list[widget.index1].image2!,
                                          fit: BoxFit.fill,
                                          height:
                                          MediaQuery.of(context).size.width * 0.3,
                                          width:
                                          MediaQuery.of(context).size.width * 0.3,
                                        ),
                                      ]);
                                },
                              ),
                            )
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
                                                if(widget.index1>=0 && widget.index1<99){
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
                                                if(widget.index1>0 && widget.index1<=99){
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
                                ),
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
