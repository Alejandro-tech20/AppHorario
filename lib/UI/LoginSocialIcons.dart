
import 'package:flutter/material.dart';


class LoginSocialIcons extends StatelessWidget {
  final List<Color> colors;
  final IconData icon;
  final Function onPress;
  const LoginSocialIcons({
    this.colors,
    this.icon,
    this.onPress,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            tileMode: TileMode.clamp,
          ),
        ),
        child: RawMaterialButton(
          onPressed: onPress,
          shape: CircleBorder(),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}