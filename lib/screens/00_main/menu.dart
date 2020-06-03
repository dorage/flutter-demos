import 'package:animate_route_transition/screens/01_transition/Page1.dart';
import 'package:animate_route_transition/screens/02ProviderCounter/ProviderCounter.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _menuItem(
              context,
              '01',
              'Animate a widget across screens',
              'https://flutter.dev/docs/cookbook/navigation/hero-animations',
              Page1(),
            ),
            SizedBox(height: 10),
            _menuItem(
              context,
              '02',
              'Provider Counter',
              'https://github.com/flutter/samples/tree/master/provider_counter',
              providerCounter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    String chapter,
    String title,
    String referenceUrl,
    Widget page,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //title
          Text(
            'CH$chapter. $title',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          SizedBox(height: 10),
          // url
          Text(referenceUrl),
          SizedBox(height: 10),
          // button Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _menuItemButton(
                color: Colors.blue[300],
                child: _peanut('Go', Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => page,
                    ),
                  );
                },
              ),
              _menuItemButton(
                color: Colors.blueGrey[300],
                child: _peanut('Refer Link', Icons.keyboard_arrow_right),
                onPressed: null,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItemButton({
    Widget child,
    Color color,
    onPressed,
  }) {
    return SizedBox(
      width: 140,
      child: RaisedButton(
        color: color,
        child: child,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }

  Widget _peanut(
    text,
    icon,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text),
        Icon(icon),
      ],
    );
  }
}
