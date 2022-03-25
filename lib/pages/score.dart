import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/model/data.dart';
import 'package:main/pages/about.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Score extends StatefulWidget {
  List score = [];
  double point;
  Data? qdata;

  Score(
      {Key? key, required this.score, required this.point, required this.qdata})
      : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    double total = widget.score
        .fold(0, (previousValue, element) => previousValue + element);
    int percent = (widget.point).round();
    double display_score = 100 * ((4 - percent) / 4);
    return Scaffold(
        body: Container(
            color: Color(0xffECECEF),
            child: Neumorphic(
                margin: EdgeInsets.all(40),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  intensity: 1,
                  depth: -4,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  lightSource: LightSource.topLeft,
                  color: Color(0xff00000029),
                  shadowLightColorEmboss: Colors.white,
                ),
                child: Container(
                    width: 1460,
                    height: 720,
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Text(
                                "PERCEIVED STRESS REPORT",
                                style: GoogleFonts.montserrat(
                                    fontSize: 28,
                                    color: Color(0xff6DD179),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: SizedBox(
                                width: 320,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('card.svg',
                                        width: 150,
                                        height: 100,
                                        alignment: Alignment.center,
                                        fit: BoxFit.fill),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Text(
                                            "$display_score",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Perceived Stress Score",
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black
                                                    .withOpacity(0.7)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 10),
                                    child: SizedBox(
                                      width: 640,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 20,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xffCEECD1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text("0 - 30 Good"),
                                          ),
                                          SizedBox(
                                            width: 480,
                                            child: Text(
                                                "Scores ranging from 0-30 would be considered as low stress."),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                      width: 640,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 20,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF4F4F4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text("31 - 60 Average"),
                                          ),
                                          SizedBox(
                                            width: 480,
                                            child: Text(
                                                "Scores ranging from 30-60 would be considered as moderate stress."),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                      width: 640,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 20,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF4F4F4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Text("61 - 90 Poor"),
                                          ),
                                          const SizedBox(
                                            width: 480,
                                            child: Text(
                                                "Scores ranging from 60-100 would be considered as high perceived stress."),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Neumorphic(
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      intensity: 1,
                                      depth: -0.5,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      lightSource: LightSource.topLeft,
                                      color: Color(0xff00000029),
                                      shadowLightColorEmboss: Colors.white,
                                    ),
                                    child: Container(
                                      width: 180,
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: CircularPercentIndicator(
                                                center: SvgPicture.asset(
                                                  "walking.svg",
                                                  width: 50,
                                                  height: 30,
                                                ),
                                                radius: 60,
                                                lineWidth: 3.5,
                                                percent: (widget.score[0] / 24),
                                                backgroundColor:
                                                    Color(0xffECECEF),
                                                progressColor:
                                                    Color(0XffC4C4C4)),
                                          ),
                                          Text(
                                            '${widget.score[0]}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              "Physical Wellness",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Neumorphic(
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      intensity: 1,
                                      depth: -0.5,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      lightSource: LightSource.topLeft,
                                      color: Color(0xff00000029),
                                      shadowLightColorEmboss: Colors.white,
                                    ),
                                    child: Container(
                                      width: 180,
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: CircularPercentIndicator(
                                                center: SvgPicture.asset(
                                                  "work.svg",
                                                  width: 50,
                                                  height: 30,
                                                ),
                                                radius: 60,
                                                lineWidth: 3.5,
                                                percent: (widget.score[1] / 20),
                                                backgroundColor:
                                                    Color(0xffECECEF),
                                                progressColor:
                                                    Color(0XffC4C4C4)),
                                          ),
                                          Text(
                                            '${widget.score[1]}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              "Work Stress",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Neumorphic(
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      intensity: 1,
                                      depth: -0.5,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      lightSource: LightSource.topLeft,
                                      color: Color(0xff00000029),
                                      shadowLightColorEmboss: Colors.white,
                                    ),
                                    child: Container(
                                      width: 180,
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: CircularPercentIndicator(
                                                center: SvgPicture.asset(
                                                  "sad.svg",
                                                  width: 50,
                                                  height: 30,
                                                ),
                                                radius: 60,
                                                lineWidth: 3.5,
                                                percent: (widget.score[2] / 20),
                                                backgroundColor:
                                                    Color(0xffECECEF),
                                                progressColor:
                                                    Color(0XffC4C4C4)),
                                          ),
                                          Text(
                                            '${widget.score[2]}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              "Emotional Stress",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Neumorphic(
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      intensity: 1,
                                      depth: -0.5,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      lightSource: LightSource.topLeft,
                                      color: Color(0xff00000029),
                                      shadowLightColorEmboss: Colors.white,
                                    ),
                                    child: Container(
                                      width: 180,
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: CircularPercentIndicator(
                                                center: SvgPicture.asset(
                                                  "brain.svg",
                                                  width: 50,
                                                  height: 30,
                                                ),
                                                radius: 60,
                                                lineWidth: 3.5,
                                                percent: (widget.score[3] / 20),
                                                backgroundColor:
                                                    Color(0xffECECEF),
                                                progressColor:
                                                    Color(0XffC4C4C4)),
                                          ),
                                          Text(
                                            '${widget.score[3]}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              "Mental Wellness",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Neumorphic(
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      intensity: 1,
                                      depth: -0.5,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      lightSource: LightSource.topLeft,
                                      color: Color(0xff00000029),
                                      shadowLightColorEmboss: Colors.white,
                                    ),
                                    child: Container(
                                      width: 180,
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: CircularPercentIndicator(
                                                center: SvgPicture.asset(
                                                  "brain.svg",
                                                  width: 50,
                                                  height: 30,
                                                ),
                                                radius: 60,
                                                lineWidth: 3.5,
                                                percent: (widget.score[4] / 20),
                                                backgroundColor:
                                                    Color(0xffECECEF),
                                                progressColor:
                                                    Color(0XffC4C4C4)),
                                          ),
                                          Text(
                                            '${widget.score[4]}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              "Mental Wellness",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: NeumorphicButton(
                                  style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(18)),
                                      intensity: 1,
                                      depth: 3,
                                      color: Color(0xffECECEF)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => About(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Take Another Test",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: Color(0xff6DD179),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ))
                          ]),
                    )))));
  }
}
