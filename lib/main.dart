// imports
import 'dart:math';

import 'package:flutter/material.dart';

// Vars
const Color mainColor = Colors.red; // prefer const over final

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  Widget imageButton(int diceNumber) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          changeDiceFace();
        },
        child: Image.asset("images/dice$diceNumber.png"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          title: const Center(
            child: Text("Who's It?"),
          ),
          backgroundColor: mainColor,
        ),
        body: Center(
          child: Row(
            children: [
              imageButton(leftDiceNumber),
              imageButton(rightDiceNumber),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
