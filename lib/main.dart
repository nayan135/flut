import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'IDK',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var imagee;
  void getIdea() {
    current = WordPair.random();
    notifyListeners();
  }

  void image() {
    imagee = displayImage();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random TERRYFING IDEA idea:'),
          Text(appState.current.asLowerCase),
          ElevatedButton(
            onPressed: () {
              appState.getIdea();
              appState.image();
            },
            child: Text("NAYA IDEA"),
          ),
        ],
      ),
    );
  }
}
