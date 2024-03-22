import "dart:async";

import "package:basic/pixel.dart";
import "package:flutter/material.dart";
import "package:basic/button.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberOfSquares = 160;
  List<int> piece = [];
  var direction = "left";

  void startGame() {
    piece = [numberOfSquares - 3, numberOfSquares - 2, numberOfSquares - 1];
    Timer.periodic(Duration(milliseconds: 250), (time) {
      if (piece.first % 10 == 0) {
        direction = "right";
      } else if (piece.last % 10 == 9) {
        direction = "left";
      }

      setState(() {
        if (direction == "right") {
          for (int i = 0; i < piece.length; i++) {
            piece[i] += 1;
          }
        } else {
          for (int i = 0; i < piece.length; i++) {
            piece[i] -= 1;
          }
        }
      });
    });
  }

  void stack() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[700],
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: GridView.builder(
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10),
                  itemBuilder: (BuildContext context, int index) {
                    if (piece.contains(index)) {
                      return MyPixel(
                        color: Colors.white,
                      );
                    } else {
                      return MyPixel(
                        color: Colors.black,
                      );
                    }
                  }),
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      function: startGame,
                      child: Text("P L A Y",
                          style: TextStyle(color: Colors.white, fontSize: 30))),
                  MyButton(
                      function: stack,
                      child: Text("S T O P",
                          style: TextStyle(color: Colors.white, fontSize: 30)))
                ],
              ),
            ))
          ],
        ));
  }
}
