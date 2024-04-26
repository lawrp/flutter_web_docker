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
  int numberOfSquares = 100;
  List<int> piece = [];
  var direction = "left";
  List<int> landed = [1000];
  int level = 0;
  void startGame() {
    piece = [
      numberOfSquares - 3 - level * 10,
      numberOfSquares - 2 - level * 10,
      numberOfSquares - 1 - level * 10
    ];
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      if (checkWinner()) {
        _showDialog();
        timer.cancel();
      }

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

  void stack() {
    level++;
    setState(() {
      for (int i = 0; i < piece.length; i++) {
        landed.add(piece[i]);
      }
      if (level < 4) {
        piece = [
          numberOfSquares - 3 - level * 10,
          numberOfSquares - 2 - level * 10,
          numberOfSquares - 1 - level * 10
        ];
      } else if (level >= 4 && level < 8) {
        piece = [
          numberOfSquares - 2 - level * 10,
          numberOfSquares - 1 - level * 10,
        ];
      } else {
        piece = [
          numberOfSquares - 1 - level * 10,
        ];
      }
      checkStack();
    });
  }

  void reset() {
    numberOfSquares = 100;
    piece = [];
    direction = "left";
    landed = [1000];
    level = 0;
    Navigator.of(context).pop();
    startGame();
  }

  void checkStack() {
    for (int i = 0; i < landed.length; i++) {
      if (!landed.contains(landed[i] + 10) &&
          (landed[i] + 10 < numberOfSquares - 1)) {
        landed.remove(landed[i]);
      }
    }
    for (int i = 0; i < landed.length; i++) {
      if (!landed.contains(landed[i] + 10) &&
          (landed[i] + 10 < numberOfSquares - 1)) {
        landed.remove(landed[i]);
      }
    }
  }

  bool checkWinner() {
    if (landed.last < 10) {
      return true;
    } else {
      return false;
    }
  }
  //bool checkLost() {
  // if ()
  // }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Winner!",
              textAlign: TextAlign.center,
            ),
            actions: [
              MyButton(
                  function: reset,
                  child: Text("Play Again",
                      style: TextStyle(color: Colors.white, fontSize: 30))),
            ],
          );
        });
  }

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
                    } else if (landed.contains(index)) {
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
