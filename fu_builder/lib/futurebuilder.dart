import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: CustomFutureBuilder(),
    ),
  ));
}

Future<String> getUserData() async {
  return await Future.delayed(Duration(seconds: 6), () => "End");
}

// Future Builder Code
class CustomFutureBuilder extends StatefulWidget {
  const CustomFutureBuilder({Key? key}) : super(key: key);

  @override
  _CustomFutureBuilderState createState() => _CustomFutureBuilderState();
}

class _CustomFutureBuilderState extends State<CustomFutureBuilder> {
  Future<String> _future = getUserData();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: "Start",
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasError) {
          return Container(
            child: Center(
              child: Text(
                "Future Data👉:  ${snapshot.data}",
                style: TextStyle(fontSize: 30),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: _future,
    );
  }
}
