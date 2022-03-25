import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/pages/option.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset('background.svg',
            alignment: Alignment.center,
            width: 2000,
            height: 950,
            fit: BoxFit.fill),
        Container(
          padding: EdgeInsets.fromLTRB(45, 40, 45, 20),
          child: Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              intensity: 1,
              depth: 2,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              lightSource: LightSource.topLeft,
              color: Color(0xff00000029),
              shadowLightColorEmboss: Colors.white,
            ),
            child: Container(
              width: 1450,
              height: 550,
              child: Center(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 90),
                    child: SvgPicture.asset('stress.svg',
                        alignment: Alignment.center,
                        width: 300,
                        height: 200,
                        fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Perceived Stress Test (PST)",
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                        "Quantify your stress levels by answering a questionnaire",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color:
                                Color.fromARGB(0, 0, 0, 1).withOpacity(0.5))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: 130,
                      child: TextButton(
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            splashFactory: NoSplash.splashFactory),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Option()),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Proceed",
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Color(0xff6DD179),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color(0xff6DD179),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
        )
      ],
    ));
  }
}
