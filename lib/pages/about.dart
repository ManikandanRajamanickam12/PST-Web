import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:main/pages/question.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffECECEF),
        child: Neumorphic(
            margin: EdgeInsets.all(45),
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              intensity: 1,
              depth: -5,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              lightSource: LightSource.topLeft,
              color: Color(0xff00000029),
              shadowLightColorEmboss: Colors.white,
            ),
            child: Container(
              width: 1460,
              height: 720,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      "PERCEIVED STRESS TEST",
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 1200,
                    height: 120,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                      child: RichText(
                          text: TextSpan(
                        text:
                            "  A more precise measure of personal stress can be determined by using a variety of instruments that have been designed to help measure individual stress levels. The first of these is called the ",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Color(0xff00000029).withOpacity(0.8),
                            height: 1.5),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Perceived Stress Scale.',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0))),
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset('card.svg',
                        width: 140,
                        alignment: Alignment.center,
                        fit: BoxFit.fill),
                  ),
                  SizedBox(
                    width: 1200,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "The ",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Color(0xff00000029).withOpacity(0.8),
                                height: 1.5),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Perceived Stress Scale.',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              TextSpan(
                                text:
                                    "is a classic stress assessment instrument. The tool, while originally developed in 1983, remains a popular choice for helping us understand how different situations affect our feelings and our perceived stress. The questions in this scale ask about your feelings and thoughts during the last month. In each case, you will be asked to indicate how often you felt or thought a certain way. Although some of the questions are similar, there are differences between them and you should treat each one as a separate question. The best approach is to answer fairly quickly. That is, don’t try to count up the number of times you felt a particular way; rather indicate the alternative that seems like a reasonable estimate.",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Color(0xff00000029).withOpacity(0.8),
                                    height: 1.5),
                              )
                            ],
                          )),
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
                              builder: (context) => Question(),
                            ),
                          );
                        },
                        child: Text(
                          "Get Question",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: Color(0xff6DD179),
                              fontWeight: FontWeight.w600),
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
