import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _counter = 1;
  final _gradientMultiple = 5;
  final _gradientsymetricMultiple = 2;

  @override
  Widget build(BuildContext context) {
    Color _getRandomColor() {
      final random = Random();
      final randomRed = random.nextInt(255);
      final randomGreen = random.nextInt(255);
      final randomBlue = random.nextInt(255);
      return Color.fromRGBO(randomRed, randomGreen, randomBlue, 1.0);
    }

    bool _multipleOf(int value) {
      return (_counter % value == 0);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: GestureDetector(
          onTap: () {
            setState(() {
              _counter++;
            });
          },
          child: Container(
            decoration: _multipleOf(_gradientMultiple)
                ? BoxDecoration(
                    gradient: LinearGradient(
                        begin: _multipleOf(_gradientsymetricMultiple)
                            ? Alignment.centerLeft
                            : Alignment.topCenter,
                        end: _multipleOf(_gradientsymetricMultiple)
                            ? Alignment.centerRight
                            : Alignment.bottomCenter,
                        colors: [_getRandomColor(), _getRandomColor()]))
                : null,
            color: _multipleOf(_gradientMultiple) ? null : _getRandomColor(),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hey there",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 34)),
                Text("Count - $_counter",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 21))
              ],
            )),
          ),
        )));
  }
}
