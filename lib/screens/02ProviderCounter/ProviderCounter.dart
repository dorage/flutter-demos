import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget providerCounter() {
  return ChangeNotifierProvider(
    create: (context) => Counter(),
    child: _ProviderCounter(),
  );
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }

  void decrement() {
    value -= 1;
    notifyListeners();
  }
}

class _ProviderCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: _Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You have pushed the button this many times'),
          Consumer<Counter>(
            builder: (context, counter, child) => Text('${counter.value}'),
          )
        ],
      ),
    );
  }
}
