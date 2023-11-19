import 'package:flutter/material.dart';

class FadeTransitionScreen extends StatefulWidget {
  const FadeTransitionScreen({super.key});

  @override
  _FadeTransitionScreenState createState() => _FadeTransitionScreenState();
}

class _FadeTransitionScreenState extends State<FadeTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fade Transition Recipe'),
        ),
        body: Center(
          child: FadeTransition(
            opacity: animation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.purple,
            ),
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    dispose();
  }
}
