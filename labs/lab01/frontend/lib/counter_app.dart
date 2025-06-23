import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 100,
      height : 400,
      padding : const EdgeInsets.all(16),
      margin : const EdgeInsets.symmetric(vertical : 8),
      decoration : const BoxDecoration(
        color : Colors.lightGreenAccent,
      ),
      child : Column (
        children : [
          Text (
            "$_counter",
            style : const TextStyle(
              color : Colors.white,
              fontSize: 24,
            ),
          ),

          const SizedBox(height : 8),
          IconButton(
            onPressed : _increment,
            icon: Icon(Icons.add),
            tooltip: 'Increment',
          ),

          const SizedBox(height : 8),
          IconButton(
            onPressed : _decrement,
            icon: Icon(Icons.remove),
            tooltip: 'Decrement',
          ),

          const SizedBox(height : 8),
          IconButton(
            onPressed : _reset,
            icon: Icon(Icons.refresh),
            tooltip: 'Reset',
          ),
        ],
      ),
    );
  }
}
