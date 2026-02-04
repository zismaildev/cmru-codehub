import 'package:flutter/material.dart';
import 'Input.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Input());
  }
}
