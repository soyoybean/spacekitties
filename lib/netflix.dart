import 'package:flutter/material.dart';

class Netflix extends StatefulWidget {
  @override
  _Netflix createState() => _Netflix();
}

class _Netflix extends State<Netflix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Soyon Kim')),
        body: Center(
          child: Text(
            'This is a new screen',
            style: TextStyle(fontSize: 24.0),
          ),
        ));
  }
}
