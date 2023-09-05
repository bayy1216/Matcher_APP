import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyScreen build');
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(color: Colors.red, height: 600),

          Container(color: Colors.yellow, height: 600),
        ],
      ),
    );
  }
}
