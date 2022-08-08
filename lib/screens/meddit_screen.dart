import 'package:flutter/material.dart';

class MedditPage extends StatelessWidget {
  const MedditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text('Meddit'),
        ),
        body: Container(
          color: Colors.white,
        ));
  }
}
