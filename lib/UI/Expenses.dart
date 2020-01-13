import 'package:apphorario/UI/ExpBody.dart';
import 'package:apphorario/resources/BottomIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeExp(),
    );
  }
}

class HomeExp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomIcon(icon: FontAwesomeIcons.history),
            BottomIcon(icon: FontAwesomeIcons.chartPie),
            SizedBox(
              width: 55.0,
            ),
            BottomIcon(icon: FontAwesomeIcons.wallet),
            BottomIcon(icon: FontAwesomeIcons.tools),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.black.withOpacity(.20),
        ),
        onPressed: () {},
      ),
      body: ExpBody(),
    );
  }
}
