import 'package:flutter/material.dart';

class PresentPage extends StatelessWidget {
  // const PresentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Present'),
        ),
        body: Center(
            child: Text(
          'Present',
          style: TextStyle(fontSize: 25),
        )),
      );
}
