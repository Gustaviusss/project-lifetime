import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer() {
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    TextStyle timerStyle = const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 3);

    Widget buildTime() {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final hours = twoDigits(duration.inHours);
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));

      return Text('$hours:$minutes:$seconds', style: timerStyle);
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTime(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: IconButton(
                          hoverColor: Colors.black,
                          onPressed: () => stopTimer(),
                          icon: Icon(Icons.pause),
                          color: Colors.white,
                          iconSize: 48,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: IconButton(
                          hoverColor: Colors.black,
                          onPressed: () => startTimer(),
                          icon: Icon(Icons.play_arrow),
                          color: Colors.white,
                          iconSize: 48,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Column(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              "Projetos",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          )),
                      Expanded(
                        flex: 8,
                        child: ListView.builder(
                          itemCount: 35,
                          itemBuilder: (context, index) {
                            return Card(
                                color: Colors.black,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.album,
                                    color: Colors.grey.shade200,
                                  ),
                                  title: Text(
                                    'Projeto $index',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Text(
                                      'despription of the project',
                                      style: TextStyle(color: Colors.white)),
                                  trailing: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey.shade200,
                                  ),
                                ));
                          },
                        ),
                      )
                    ],
                  ))),
        ],
      )),
    );
  }
}
