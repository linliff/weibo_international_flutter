import 'package:flutter/material.dart';

import 'SplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: "微博国际版",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          home: SplashPage()),
    );
  }
}
