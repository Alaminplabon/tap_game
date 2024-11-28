import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int redCount = 50;
  int blueCount = 50;

  void redSection() {
    setState(() {
      redCount = redCount + 8;
      blueCount = blueCount - 8;
    });
  }

  void blueSection() {
    setState(() {
      blueCount = blueCount + 5;
      redCount = redCount - 5;
    });
  }

  void resetGame() {
    setState(() {
      redCount = 50;
      blueCount = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: redCount,
                  child: InkWell(
                    onTap: redSection,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  flex: blueCount,
                  child: InkWell(
                    onTap: blueSection,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            redCount >= 100 || blueCount >= 100
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.purple.withOpacity(0.5),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "The Winner Is ${redCount >= 100 ? "RED" : "BLUE"}",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: resetGame,
                            child: Text("Restart"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ))),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
