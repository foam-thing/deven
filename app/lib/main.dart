import 'package:flutter/material.dart';

import 'package:app/views/app.dart';
import 'package:app/views/demo.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      title: 'Dev Eng',
      initialRoute: '/',
      routes: {
        '/': (context) => const App(),
        '/demo': (context) => const MyApp(),
      },
    );
  }
}
