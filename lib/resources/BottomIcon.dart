import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final Function funccion;

  const BottomIcon({Key key, this.icon, this.funccion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
          
        ),
      ),
      onTap: funccion,
    );
  }
}
