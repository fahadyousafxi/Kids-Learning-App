import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../utilities/model_1.dart';
import '../../../utilities/snakbar.dart';
import 'guess_Alphabets.dart';



class GuessMonths extends StatefulWidget{

  @override
  State<GuessMonths> createState() => _GuessMonthsState();
}
List<Numbermodel> monthlist = month1();
class _GuessMonthsState extends State<GuessMonths> {
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
            title: Text('Month',style: TextStyle( color: Colors.black,fontFamily: "arlrdbd"),
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
                              child: Text(monthlist[index].Text!,style: TextStyle(color: Colors.black,fontSize: 23.0,fontFamily: "arlrdbd"),),
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
                                  for(int i = 0;i<alphasongs2 [index].answer.length;i++)
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.red)
                                      ),
                                      elevation: 5.0,
                                      height: 10,
                                      minWidth: double.infinity,
                                      color: isPressed ? monthsongs2  [index].answer.entries.toList()[i].value?istrue:isWrong:Colors.white,
                                      padding: EdgeInsets.symmetric(vertical:10.0),
                                      onPressed: isPressed?(){}
                                          :(){
                                        if(monthsongs2[index].answer.entries.toList()[i].value){
                                          setState(() {
                                            isPressed = true;
                                          }
                                          );
                                          score +=  1;
                                          print(score);
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
                                        image: AssetImage(monthsongs2[index].answer.keys.toList()[i]),height: 100,
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
                                      onTap: ()=>flutterTts.speak(monthlist[index].Text!),
                                      child: Image.asset('assets/images/11MaskGroup3.png',alignment: Alignment.topCenter,)),
                                  Center(
                                      child: ListTile(
                                        trailing: InkWell(
                                          onTap:  isPressed ? index + 1== monthquestion.length
                                              ?(){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultSrceen(score)));
                                          }
                                              :(){
                                            _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.linear);
                                            flutterTts.speak(monthlist[index  +1].Text!);

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
                                            flutterTts.speak(monthlist[index-1].Text!);
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
