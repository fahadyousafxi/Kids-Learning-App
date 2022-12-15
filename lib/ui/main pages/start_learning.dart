import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kidslearning/mylist.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Alphabet.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Animals.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Brids.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Colors.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Flowers.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Fruit.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Month.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Number.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Shapes.dart';
import 'package:kidslearning/ui/main%20pages/start%20learning/learning_Vegitable.dart';
import 'package:kidslearning/utilities/model_1.dart';

import '../../utilities/admob.dart';

class StartLearning extends StatefulWidget {
  int? index;
  StartLearning();

  @override
  State<StartLearning> createState() => _LetsStartLearningState();
}

class _LetsStartLearningState extends State<StartLearning> {
  var rand = Random().nextInt(7);

  @override
  Widget build(BuildContext context) {
    List<Widget> listData = [
      MyList().myInkwell(
          nextPage: LearningAlphabet(),
          nImage: 'assets/images/Alphabet.png',
          nName: 'Alphabet',
          context: context),
      MyList().myInkwell(
          nextPage: LearningNumbers(),
          nImage: 'assets/images/Numbers.png',
          nName: 'Number',
          context: context),
      MyList().myInkwell(
          nextPage: LearningColor(),
          nImage: 'assets/images/Color.png',
          nName: 'Color',
          context: context),
      MyList().myInkwell(
          nextPage: LearningShapes(),
          nImage: 'assets/images/Shapes.png',
          nName: 'Shapes',
          context: context),
      MyList().myInkwell(
          nextPage: LearningAnimal(),
          nImage: 'assets/images/Animals.png',
          nName: 'Animal',
          context: context),
      MyList().myInkwell(
          nextPage: LearningBrids(),
          nImage: 'assets/images/Birds.png',
          nName: 'Bird',
          context: context),
      MyList().myInkwell(
          nextPage: LearningFlower(),
          nImage: 'assets/images/Flowers.png',
          nName: 'Flower',
          context: context),
      MyList().myInkwell(
          nextPage: LearningFruits(),
          nImage: 'assets/images/Fruit.png',
          nName: 'Fruit',
          context: context),
      MyList().myInkwell(
          nextPage: LearningMonth(),
          nImage: 'assets/images/Month.png',
          nName: 'Month',
          context: context),
      MyList().myInkwell(
          nextPage: LearningVegitable(),
          nImage: 'assets/images/Vegitable.png',
          nName: 'Vegitable',
          context: context),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "PreSchool Kids Learning",
          style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
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
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            )
          ],
        ),
        Column(
          children: [
            Expanded(
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyList().Pages[index]));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: appColors[Random().nextInt(7)],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // SizedBox(height: 0,),
                              Expanded(
                                  child: Image.asset(MyList().images[index])),
                              Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Colors.red.withOpacity(0.3)),
                                  child: Center(
                                      child: Text(
                                    MyList().mynames[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "arlrdbd",
                                        fontSize: 18),
                                  ))),
                            ],
                          ),
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
      ]),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.13,
        width: 25,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
        ),
      ),
    );
  }
}
