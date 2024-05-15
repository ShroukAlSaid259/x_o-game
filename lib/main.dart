import 'package:flutter/material.dart';
import 'package:x_o/game.dart';
import 'package:x_o/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        GameScreen.routeName: (context) => GameScreen(),
        LoginScreen.routeName: (context) => LoginScreen()
      },
      theme: ThemeData(
          textTheme: TextTheme(
              headlineLarge:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              headlineSmall:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
    );
  }
}
