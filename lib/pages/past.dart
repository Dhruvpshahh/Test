import 'package:flutter/material.dart';

class PastPage extends StatelessWidget {
  // const PastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Past'),
        ),
        body: const Center(
            child: Text(
          'Past',
          style: TextStyle(fontSize: 25),
        )),
      );
}
