import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ConfettiController();
  bool isplaying = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isplaying) {
                  _controller.stop();
                } else {
                  _controller.play();
                }
                ;
                isplaying = !isplaying;
              },
              child: Text('Party Time'),
              color: Colors.deepPurple[300],
            ),
          ),
        ),
        ConfettiWidget(confettiController: _controller,
        blastDirection: pi/2,
        colors:const [
          Colors.black,Colors.red,Colors.purple,Color.fromARGB(255, 45, 66, 83),
        ],
        gravity: 0.01,
        emissionFrequency: 0.5,
        ),
      ],
    );
  }
}
