import 'package:animate_route_transition/screens/01_transition/Page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transition Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _arrowButton(context, "up"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _arrowButton(context, "left"),
                _arrowButton(context, "right"),
              ],
            ),
            _arrowButton(context, "down"),
          ],
        ),
      ),
    );
  }
}

Map<String, dynamic> directionInfo = {
  "up": {"icons": Icons.keyboard_arrow_up, "offset": Offset(0.0, 1.0)},
  "down": {"icons": Icons.keyboard_arrow_down, "offset": Offset(0.0, -1.0)},
  "left": {"icons": Icons.keyboard_arrow_left, "offset": Offset(1.0, 0.0)},
  "right": {"icons": Icons.keyboard_arrow_right, "offset": Offset(-1.0, 0.0)},
};

RaisedButton _arrowButton(BuildContext context, String direction) =>
    RaisedButton(
      child: Icon(directionInfo[direction]["icons"]),
      onPressed: () {
        Navigator.of(context).push(_createRoute(direction));
      },
    );

Route _createRoute(String direction) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //var begin = directionInfo[direction]["offset"];
      final dx = directionInfo[direction]["offset"].dx;
      final dy = directionInfo[direction]["offset"].dy;
      var begin = Offset(dx, dy);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
