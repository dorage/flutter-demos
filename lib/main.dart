import 'package:animate_route_transition/screens/00_main/menu.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animate tutorial',
      theme: ThemeData(primaryColor: Colors.blue[50]),
      home: Menu(),
    );
  }
}
