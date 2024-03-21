import "package:basic/pixel.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberOfSquares = 160;

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
                    return MyPixel(
                      color: Colors.black,
                    );
                  }),
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.grey[900],
                        child: Center(child: Text("PLAY")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.red[900],
                        child: Center(child: Text("PLAY")),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
