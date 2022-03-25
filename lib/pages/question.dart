import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/model/data.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:main/model/scroll.dart';
import 'package:main/pages/about.dart';
import 'package:main/pages/back.dart';
import 'package:main/pages/score.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int currentanswer = 0;
  int score = 0;
  int sum = 0;
  int pos = 0;
  int i = 0;

  bool btnpressed1 = false;
  bool btnpressed2 = false;
  bool btnpressed3 = false;
  bool btnpressed4 = false;
  bool completed = true;
  Data? qdata;
  Map<String?, int?> item = {};
  List? sessioncount;
  List score_section = [];
  int sessionscore = 0;
  int? value;
  final ScrollController controller = ScrollController();

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('questions.json');
    var mydata = json.decode(jsonText);
    setState(() => qdata = Data.fromJson(mydata));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  String calcuateScore() {
    sessioncount = qdata!.segmentsCount;

    while (pos < sessioncount!.length) {
      for (i = 0; i < sessioncount![pos]; i++) {
        sessionscore = sessionscore + item.values.elementAt(i)!.toInt();
      }
      score_section.add(sessionscore);
      sessionscore = 0;
      pos = pos + 1;
    }
    print(item.length);
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SvgPicture.asset('background2.svg',
          alignment: Alignment.center,
          width: 2000,
          height: 950,
          fit: BoxFit.fill),
      Column(children: [
        if (completed == true) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      intensity: 0.8,
                      depth: 1,
                      boxShape: NeumorphicBoxShape.circle(),
                      color: Color.fromARGB(255, 233, 232, 229)),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BackOption(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.black.withOpacity(0.7),
                        )),
                  ),
                ),
              ),
              Container(
                width: 1300,
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          intensity: 1,
                          depth: -5,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          color: Color(0xff00000029),
                          shadowLightColorEmboss: Colors.white,
                        ),
                        child: Container(
                            width: 760,
                            height: 560,
                            child: Center(
                                child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "PERCEIVED STRESS TEST",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 25,
                                      color: Color(0xff6DD179),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Column(children: [
                                if (qdata != null)
                                  Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          height: 460,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        40, 80, 40, 40),
                                                child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                        text:
                                                            '${currentanswer + 1}. ',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    32,
                                                                    32,
                                                                    32),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: qdata!
                                                                  .questions![
                                                                      currentanswer]
                                                                  .question
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    32,
                                                                    32,
                                                                    32),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ))
                                                        ])),
                                              ),
                                              Container(
                                                width: 750,
                                                height: 180,
                                                alignment: Alignment.center,
                                                child: Wrap(
                                                    spacing:
                                                        150.0, // gap between adjacent chips
                                                    runSpacing:
                                                        44.0, // gap between lines
                                                    children: List.generate(
                                                      qdata!
                                                          .questions![
                                                              currentanswer]
                                                          .answers!
                                                          .length,
                                                      (index) => SizedBox(
                                                        width: 180,
                                                        height: 40,
                                                        child: NeumorphicButton(
                                                          style: NeumorphicStyle(
                                                              shape:
                                                                  NeumorphicShape
                                                                      .flat,
                                                              intensity: 1,
                                                              depth: (value ==
                                                                      index)
                                                                  ? -1
                                                                  : 2,
                                                              boxShape: NeumorphicBoxShape
                                                                  .roundRect(
                                                                      BorderRadius.circular(
                                                                          20)),
                                                              color: const Color(
                                                                  0xffECECEF),
                                                              shadowLightColorEmboss:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            setState(() {
                                                              score = index + 1;

                                                              value = index;
                                                              btnpressed1 =
                                                                  true;
                                                            });
                                                          },
                                                          child: Text(
                                                            qdata!
                                                                .questions![
                                                                    currentanswer]
                                                                .answers![index],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.montserrat(
                                                                color: Color(
                                                                        0xff000000)
                                                                    .withOpacity(
                                                                        0.7)),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                              Column(
                                                children: [
                                                  if (btnpressed1 == true)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 40),
                                                      child: SizedBox(
                                                        width: 120,
                                                        height: 40,
                                                        child: NeumorphicButton(
                                                          style: NeumorphicStyle(
                                                              shape:
                                                                  NeumorphicShape
                                                                      .flat,
                                                              intensity: 1,
                                                              depth: 2,
                                                              boxShape: NeumorphicBoxShape.roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                              color: Color(
                                                                  0xffECECEF),
                                                              shadowLightColorEmboss:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            setState(() {
                                                              if (currentanswer ==
                                                                  qdata!.questions!
                                                                          .length -
                                                                      1) {
                                                                completed =
                                                                    false;
                                                              }

                                                              if (currentanswer <=
                                                                      qdata!.questions!
                                                                              .length -
                                                                          1 &&
                                                                  btnpressed1 ==
                                                                      true) {
                                                                sum =
                                                                    sum + score;
                                                                item[qdata!
                                                                    .questions![
                                                                        currentanswer]
                                                                    .question] = score;
                                                                currentanswer =
                                                                    currentanswer +
                                                                        1;
                                                                btnpressed1 =
                                                                    false;
                                                                value = null;
                                                                print(sum);
                                                              }
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              if (currentanswer ==
                                                                  qdata!.questions!
                                                                          .length -
                                                                      1)
                                                                Text("Done",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                            color:
                                                                                Color(0xff000000).withOpacity(0.7)))
                                                              else
                                                                Text(
                                                                  "Next",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: GoogleFonts.montserrat(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Color(
                                                                          0xff6DD179)),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Question ',
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xff000000)
                                                    .withOpacity(0.7),
                                                fontSize: 14,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text: ' ${currentanswer + 1}',
                                              style: GoogleFonts.montserrat(
                                                  color: Color(0xff6DD179),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            TextSpan(
                                                text:
                                                    ' / ${qdata!.questions!.length}',
                                                style: GoogleFonts.montserrat(
                                                    color: Color(0xff000000)
                                                        .withOpacity(0.7),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ])),
                                    ],
                                  )
                              ]),
                            ]))))
                  ],
                ),
              ),
            ],
          )
        ] else ...[
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                      depth: -3,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      color: Color(0xff00000029),
                      shadowLightColorEmboss: Colors.white,
                    ),
                    child: Container(
                      width: 760,
                      height: 300,
                      child: Center(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              "You have successfully completed questions",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  fontSize: 25,
                                  color: Color(0xff6DD179),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: NeumorphicButton(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.flat,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(18)),
                                    intensity: 1,
                                    depth: 3,
                                    color: Color(0xffECECEF)),
                                onPressed: () {
                                  calcuateScore();
                                  print(item);
                                  print(sum);
                                  print(score_section);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Score(
                                        score: score_section,
                                        point: sum / qdata!.questions!.length,
                                        qdata: qdata,
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Get Score",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Color(0xff6DD179),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text("Click on get score to view the score",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black.withOpacity(0.7))),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
      ]),
    ]));
  }
}
