import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kidslearning/utilities/snakbar.dart';
import '../../../utilities/model_1.dart';
import 'guess_Alphabets.dart';



class GuessAnimals extends StatefulWidget{

  @override
  State<GuessAnimals> createState() => _GuessAnimalsState();
}
List<Numbermodel> animallist = ANIMAL1();

class _GuessAnimalsState extends State<GuessAnimals> {
  final FlutterTts flutterTts = FlutterTts();
  bool isPressed = false;
  Color istrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.blue;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    PageController _controller = new PageController(initialPage: 0);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
          elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.transparent,
            title: Text('Animal',style: TextStyle( color: Colors.black,fontFamily: "arlrdbd"),
            )
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (page){
                        isPressed = false;
                      },
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: alphasongs2.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.0,
                            ),
                            Image.asset("assets/images/volume.png", height: 111,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(animallist[index].Text!,style: TextStyle(color: Colors.black,fontSize: 23.0,fontFamily: "arlrdbd"),),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            Expanded(
                              child: GridView.count(
                                padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 15,
                                crossAxisCount: 2,
                                physics: NeverScrollableScrollPhysics(),
                                primary: false,
                                children: [
                                  for(int i = 0;i<animalsongs2 [index].answer.length;i++)
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.red)
                                      ),
                                      elevation: 5.0,
                                      height: 10,
                                      minWidth: double.infinity,
                                      color: isPressed ? animalsongs2[index].answer.entries.toList()[i].value?istrue:isWrong:Colors.white,
                                      padding: EdgeInsets.symmetric(vertical:10.0),
                                      onPressed: isPressed?(){}
                                          :(){
                                        if(animalsongs2[index].answer.entries.toList()[i].value){
                                          setState(() {
                                            isPressed = true;
                                          }
                                          );
                                          score +=  1;
                                          print(score);
                                          print(' sdfghj xcvghjk');
                                          SnackBar1().showCorrectSnak();
                                        }else{
                                          setState(() {
                                            isPressed = true;
                                          }
                                          );
                                          SnackBar1().showErrorSnak();
                                        }
                                      },
                                      child: Image(
                                        image: AssetImage(animalsongs2[index].answer.keys.toList()[i]),height: 100,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: ()=>flutterTts.speak(animallist[index].Text!),
                                      child: Image.asset('assets/images/11MaskGroup3.png',alignment: Alignment.topCenter,)),
                                  Center(
                                      child: ListTile(
                                        trailing: InkWell(
                                          onTap:  isPressed ? index + 1== animalquestion.length
                                              ?(){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultSrceen(score)));
                                          }
                                              :(){
                                            _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.linear);
                                            flutterTts.speak(animallist[index  +1].Text!);

                                          }:null,
                                          child: Image(
                                            image: AssetImage('assets/images/11MaskGroup5.png'),
                                          ),
                                        ),
                                        leading: InkWell(
                                          onTap: isPressed ? index - 1== questions.length
                                              ?(){}
                                              :(){
                                            _controller.previousPage(duration: Duration(microseconds: 500), curve: Curves.linear);
                                            flutterTts.speak(animallist[index-1].Text!);
                                          }:null,
                                          child: Image(
                                            image: AssetImage('assets/images/11MaskGroup4.png'),
                                          ),
                                        ),

                                      )
                                  ),
                                  SizedBox(height: 20,)

                                ]
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
