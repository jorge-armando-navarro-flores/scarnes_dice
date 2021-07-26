import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scarne's dice",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(title: "Scarne's dice"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int userOverallScore = 0;
  int userTurnScore = 0;
  int computerOverallScore = 0;
  int computerTurnScore =  0;
  int diceSide = 1;
  bool isButtonDisabled = false;
  String movement = '';


  Future updateDiceSide() async{
    await new Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      diceSide = 1 + Random().nextInt(6);
    });
  }


  Future<void> roll()async{
    for(int i = 0; i<= 10; i++){
      await updateDiceSide();
    }
  }

  void reset(){
    setState(() {
      userOverallScore = 0;
      userTurnScore = 0;
      computerOverallScore = 0;
      computerTurnScore =  0;
      diceSide = 1;
      movement = 'Reset';
    });

  }

  void hold(){
    setState(() {
      userOverallScore += userTurnScore;
      userTurnScore = 0;
      movement = 'User holds';
    });
  }

  void userTurn() async{
    await roll();
    setState(() {
      if(diceSide != 1){
        userTurnScore += diceSide;
      }else{
        userTurnScore = 0;
        movement = 'User rolls a 1';
      }
      movement = 'Your turn score: $userTurnScore';
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your score: $userOverallScore"),
                Text("Computer score: $computerOverallScore")
              ],
            ),
            Text(movement),
            Expanded(
              child: Image(
                  image: AssetImage("images/dice$diceSide.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  text: "ROLL",
                  onPressed: userTurn,
                ),

                ActionButton(
                  text: "HOLD",
                  onPressed:isButtonDisabled? null: hold,
                ),

                ActionButton(
                  text: "RESET",
                  onPressed: (){
                    reset();
                  },
                )

              ],
            )

          ],
        ),
      ),

    );
  }
}

class ActionButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  ActionButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text!,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[350],
        ),

    );
  }
}
