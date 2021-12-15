import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gesture extends StatefulWidget {
  const Gesture({Key? key}) : super(key: key);

  @override
  _GestureState createState() => _GestureState();
}

class _GestureState extends State<Gesture> {
  String _text = "No Gesture detected!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('点击、双击、长按')),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(
              _text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          onTap: () => updateText("点击"),
          onDoubleTap: () => updateText("双击"),
          onLongPress: () => updateText("长按"),
        ),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _text = text;
    });
  }
}
