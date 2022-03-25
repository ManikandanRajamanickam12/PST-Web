import 'package:flutter/material.dart';
import 'package:main/pages/about.dart';
import 'package:main/pages/onboard.dart';
import 'package:main/pages/option.dart';
import 'package:main/pages/question.dart';
import 'package:main/pages/score.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PST Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: OnBoard(),
    );
  }
}
