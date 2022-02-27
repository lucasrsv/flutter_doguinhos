import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(primaryColor: CupertinoColors.activeBlue),
      home: Home(),
    );
  }
}