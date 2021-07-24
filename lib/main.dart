import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                Text("Your score: 0"),
                Text("Computer score: 0")
              ],
            ),
            Text("Current move"),
            Expanded(
              child: Image(
                  image: AssetImage("images/dice1.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  text: "ROLL",
                  onPressed: (){

                  },
                ),

                ActionButton(
                  text: "HOLD",
                  onPressed: (){

                  },
                ),

                ActionButton(
                  text: "RESET",
                  onPressed: (){

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
