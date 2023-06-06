import 'package:flutter/material.dart';

import 'views/home.dart';

void main() => runApp(const FirstProject());

class FirstProject extends StatelessWidget {
  const FirstProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Project",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}
