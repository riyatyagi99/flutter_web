import 'dart:async';
import 'package:flutter/material.dart';
import 'background_timer.dart';

class TimerPage extends StatefulWidget {
   TimerPage({Key? key}):super(key: key);
  @override
  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  Timer? timer;
  int seconds = 0;
  bool isPaused = true;
/*  var timerrr = BackgroundTimer((counter) {
    print('Counter: $counter');
  });*/

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      seconds = 0;
      isPaused = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          '${(seconds / 3600).floor().toString().padLeft(2, '0')}:${((seconds % 3600) / 60).floor().toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 48.0),
        ),
        const SizedBox(width: 24.0),
        ElevatedButton(
          child: isPaused ? Icon(Icons.play_arrow):Icon(Icons.pause),
          onPressed: () {
           // timerrr.start();

            setState(() {
              isPaused = !isPaused;
            });
            if (isPaused) {
              pauseTimer();
            } else {
              startTimer();
            }
          },
        ),
      ],
    );
  }
}