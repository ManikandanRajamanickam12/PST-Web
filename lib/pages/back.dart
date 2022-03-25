import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/pages/about.dart';
import 'package:main/pages/question.dart';

class BackOption extends StatefulWidget {
  const BackOption({Key? key}) : super(key: key);

  @override
  State<BackOption> createState() => _BackOptionState();
}

class _BackOptionState extends State<BackOption> {
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
              width: 310,
              height: 230,
              child: Center(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Confirmation",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "Going back will quit the current test.\n Are you sure?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 45),
                    child: Row(
                      children: [
                        NeumorphicButton(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.rect(),
                              intensity: 1,
                              depth: -0.2,
                              color: Color(0xffECECEF)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 118,
                            child: Text(
                              "No",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color:
                                    Color.fromARGB(0, 0, 0, 0).withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        NeumorphicButton(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.rect(),
                              intensity: 1,
                              depth: -0.2,
                              color: Color(0xffECECEF)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => About(),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 118,
                            child: Text(
                              "Yes",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Color(0xff6DD179),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ])),
            ),
          ),
        ),
      ],
    ));
  }
}
