import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/screens/home_screen.dart';

void main(List<String> args) {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
