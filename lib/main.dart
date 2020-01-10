import 'package:apphorario/resources/RouteName.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'UI/Index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuadrante de Horarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.home,
      routes: {
        RouteName.home: (context) => Home(),
        RouteName.index: (context) => Index(
              title: 'Hola',
            ),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final twee = TrackT
    return Scaffold(
      body: Index(),
    );
  }
}
