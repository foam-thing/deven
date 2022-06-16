import 'package:flutter/material.dart';

import 'package:app/widgets/searchbar.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dev Eng'),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: const <Widget>[Text('a'), Text('b')],
      ),
    );
  }
}
