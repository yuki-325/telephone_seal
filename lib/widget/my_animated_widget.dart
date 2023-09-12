import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({super.key});

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _position = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {
        _position = _controller.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 100,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.only(top: _position * 100),
            child: const Center(
              child: Text('Hello'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_controller.status == AnimationStatus.completed) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: const Text('Start Animation'),
          ),
        ],
      ),
    );
  }
}
