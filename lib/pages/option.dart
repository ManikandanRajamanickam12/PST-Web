import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main/pages/about.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  String? selectedValue;
  List<String> items = [
    'Student',
    'Corporate Employee',
    'Clinician',
    'Athlete',
  ];
  bool tapped = false;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset('background2.svg',
            alignment: Alignment.center,
            width: 2000,
            height: 950,
            fit: BoxFit.fill),
        Center(
          child: Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                intensity: 1,
                depth: 2,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                lightSource: LightSource.topLeft,
                color: Color(0xff00000029)),
            child: Container(
              width: 560,
              height: 580,
              child: Center(
                  child: Column(children: [
                Container(
                  height: 330,
                  child: Column(
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Choose profession",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  intensity: 1,
                                  depth: 2,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                  lightSource: LightSource.topLeft,
                                  color: Color(0xff00000029)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  tapped = true;
                                  option1 = false;
                                  option2 = false;
                                  option3 = false;
                                  option4 = false;
                                  print("true");
                                },
                                child: Container(
                                  color: Color(0xffECECEF),
                                  width: 250,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        (tapped == false)
                                            ? (option1 == true ||
                                                    option2 == true ||
                                                    option3 == true ||
                                                    option4 == true)
                                                ? Text("$name")
                                                : Text("Corporate Employee")
                                            : Text(
                                                "Select Profession",
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.black
                                                        .withOpacity(0.4)),
                                              ),
                                        Spacer(),
                                        (tapped)
                                            ? Icon(
                                                MdiIcons.chevronUp,
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                              )
                                            : Icon(
                                                MdiIcons.chevronDown,
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 200),
                        child: Column(
                          children: [
                            if (tapped == true)
                              Neumorphic(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: 250,
                                  height: 160,
                                  child: Column(
                                    children: [
                                      Column(children: [
                                        SizedBox(
                                          width: 250,
                                          height: 40,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              shape: NeumorphicShape.flat,
                                              boxShape:
                                                  NeumorphicBoxShape.rect(),
                                              intensity: 1,
                                              depth: (option1) ? -2 : 3,
                                              color: Color(0xffECECEF),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                option1 = true;
                                                option2 = false;
                                                option3 = false;
                                                option4 = false;
                                                tapped = false;
                                                name = "Student";
                                              });
                                            },
                                            child: Text(
                                              "Student",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: (option1)
                                                    ? Colors.black
                                                        .withOpacity(0.8)
                                                    : Colors.black
                                                        .withOpacity(0.4),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 40,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              shape: NeumorphicShape.flat,
                                              boxShape:
                                                  NeumorphicBoxShape.rect(),
                                              intensity: 1,
                                              depth: (option2) ? -2 : 3,
                                              color: Color(0xffECECEF),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                option2 = true;
                                                option1 = false;
                                                option3 = false;
                                                option4 = false;
                                                tapped = false;
                                                name = "Corporate Employee";
                                              });
                                            },
                                            child: Text(
                                              "Corporate Employee",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: (option2)
                                                    ? Colors.black
                                                        .withOpacity(0.8)
                                                    : Colors.black
                                                        .withOpacity(0.4),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 40,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              shape: NeumorphicShape.flat,
                                              boxShape:
                                                  NeumorphicBoxShape.rect(),
                                              intensity: 1,
                                              depth: (option3) ? -2 : 3,
                                              color: Color(0xffECECEF),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                option3 = true;
                                                option1 = false;
                                                option2 = false;
                                                option4 = false;
                                                tapped = false;
                                                name = "Clinician";
                                              });
                                            },
                                            child: Text(
                                              "Clinician",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: (option3)
                                                    ? Colors.black
                                                        .withOpacity(0.8)
                                                    : Colors.black
                                                        .withOpacity(0.4),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 40,
                                          child: NeumorphicButton(
                                            style: NeumorphicStyle(
                                              shape: NeumorphicShape.flat,
                                              boxShape:
                                                  NeumorphicBoxShape.rect(),
                                              intensity: 1,
                                              depth: (option4) ? -2 : 3,
                                              color: Color(0xffECECEF),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                option4 = true;
                                                option1 = false;
                                                option2 = false;
                                                option3 = false;
                                                tapped = false;
                                                name = "Athlete";
                                              });
                                            },
                                            child: Text(
                                              "Athelete",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: (option4)
                                                    ? Colors.black
                                                        .withOpacity(0.8)
                                                    : Colors.black
                                                        .withOpacity(0.4),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: 165,
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
                        "Next",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Color(0xff6DD179),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                      width: 450,
                      height: 120,
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Selecting your profession ensures that the right set of questions are posed to you for assessment. Kindly note that your answers will not leave the browser and they will never be stored in our servers. By continuing you agree to accept ',
                          style: TextStyle(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'our Terms of Service',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            TextSpan(text: ' & '),
                            TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ))
                          ],
                        ),
                      )),
                )
              ])),
            ),
          ),
        ),
      ],
    ));
  }
}
