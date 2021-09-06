import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: CustomFutureBuilder(),
    ),
  ));
}

final randomNumber = Random();
Stream<String> customFunction() async* {
  for (int i = 0; i < 10; i++) {
    yield await Future.delayed(
        Duration(seconds: i + 1), () => "${randomNumber.nextInt(10) + 1}");
  }
}

// Future Builder Code
class CustomFutureBuilder extends StatefulWidget {
  const CustomFutureBuilder({Key? key}) : super(key: key);

  @override
  _CustomFutureBuilderState createState() => _CustomFutureBuilderState();
}

class _CustomFutureBuilderState extends State<CustomFutureBuilder> {
  Stream<String> _stream = customFunction();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasError) {
          return Container(
            child: Center(
                child: Text(
              "${snapshot.data}",
              style: TextStyle(fontSize: 50),
            )),
          );
        } else {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
      stream: _stream,
      initialData: "Start",
    );
  }
}
