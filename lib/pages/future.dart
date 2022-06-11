import 'package:flutter/material.dart';

class FuturePage extends StatelessWidget {
  //const FuturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Future'),
        ),
        body: Center(
            child: Text(
          'Future',
          style: TextStyle(fontSize: 25),
        )),
      );
}
