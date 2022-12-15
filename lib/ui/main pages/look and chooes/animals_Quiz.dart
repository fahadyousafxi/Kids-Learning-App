import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/model_1.dart';
import '../../../utilities/snakbar.dart';
import '../listen and guess/guess_Alphabets.dart';



class AnimalsQuiz extends StatefulWidget{
  @override
  State<AnimalsQuiz> createState() => _AnimalsQuizState();
}
List<Numbermodel> animallist =ANIMAL1();
class _AnimalsQuizState extends State<AnimalsQuiz> {
  bool isPressed = false;
  Color istrue = Color(0xFFF19335);
  Color isWrong = Color(0xFFFF0000);
  Color btnColor = Colors.blue;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    PageController _controller = new PageController(initialPage: 0);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Animal',style: TextStyle(fontFamily: "arlrdbd",color: Colors.black),),
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
                      itemCount:animalquestion.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.0,
                            ),
                            Image.asset(animallist[index].image!,height: 180,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              ],
                            ),
                            Expanded(
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(50),
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                crossAxisCount: 2,
                                primary: false,
                                children: [
                                  for(int i = 0;i<animalquestion [index].answer.length;i++)
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.red)
                                      ),
                                      elevation: 10.0,
                                      height: 10,
                                      minWidth: double.infinity,
                                      color: isPressed ? animalquestion[index].answer.entries.toList()[i].value?istrue:isWrong:Colors.white,
                                      padding: EdgeInsets.symmetric(vertical:18.0),
                                      onPressed: isPressed?(){}
                                          :(){
                                        if(animalquestion[index].answer.entries.toList()[i].value){
                                          setState(() {
                                            isPressed = true;
                                            }
                                          );
                                          score +=  1;
                                          print(score);
                                          SnackBar1().showCorrectSnak();
                                          // MotionToast.success(
                                          //     borderRadius: 5,
                                          //     animationDuration: Duration(seconds: 2),
                                          //     title: Text("Your Answer is Right",style: TextStyle(fontSize: 20),),
                                          //     iconType: ICON_TYPE.cupertino
                                          // ).show(context);
                                        }else{
                                          setState(() {
                                            isPressed = true;
                                          }
                                          );
                                          SnackBar1().showErrorSnak();
                                          // MotionToast.error(
                                          //     borderRadius: 5,
                                          //     animationDuration: Duration(seconds: 2),
                                          //     title: Text("Your Answer is Wrong",style: TextStyle(fontSize: 20),),
                                          //     iconType: ICON_TYPE.cupertino
                                          // ).show(context);
                                        }
                                      },
                                      child: Text(
                                        animalquestion[index].answer.keys.toList()[i],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "arlrdbd",
                                            fontSize: 20.0
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  heightFactor: 1.8,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: Colors.red)
                                        ),
                                      ),
                                      onPressed: isPressed ? index + 1== animalquestion.length
                                          ?(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultSrceen(score)));
                                      }
                                          :(){
                                        _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.linear);
                                      }:null,
                                      child: Text(
                                        index + 1 == animalquestion.length? "See Result":"Next Question",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontFamily: "arlrdbd",
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            )
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
