import 'package:flutter/material.dart';

// import 'package:app/widgets/searchbar.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('TODO: Search')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: const [
              Text("单词"),
              Text("翻译"),
              Text("发音"),
              Text("例句"),
              Text("备注"),
            ],
          )
        ],
      ),
    );
  }
}
