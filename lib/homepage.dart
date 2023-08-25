import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  ThemeMode th;
  HomePage(this.th);
  @override
  State<HomePage> createState() => _HomePageState(th);
}

class _HomePageState extends State<HomePage> {
  ThemeMode _themeMode;
  _HomePageState(this._themeMode);

  late Stopwatch stopwatch;
  late Timer t;
  void changeTheme(ThemeMode themedata) {
    _themeMode = themedata;
  }

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = (((milli ~/ 1000) ~/ 60) % 60).toString().padLeft(2, "0");
    String hours = (((milli ~/ 1000) ~/ 60) ~/ 60).toString().padLeft(2, "0");
    return "$hours:$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: _themeMode == ThemeMode.light
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white10,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          ),
        ),
        title: const Text(
          "STOPWATCH",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              handleStartStop();
            },
            onDoubleTap: () {
              stopwatch.reset();
            },
            child: Container(
              padding: const EdgeInsets.all(90),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.cyan.shade400,
                        blurRadius: 25.0,
                        blurStyle: BlurStyle.outer)
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 6,
                    color: Colors.cyan.shade400,
                  ),
                  color: Colors.black),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  returnFormattedText(),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 70,
          // ),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  stopwatch.reset();
                },
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: Colors.red),
                      color: Colors.black),
                  child: const Text(
                    "RESET",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  handleStartStop();
                },
                child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.green),
                        color: Colors.black),
                    child: stopwatch.isRunning
                        ? const Text(
                            "STOP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : const Text(
                            "START",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
