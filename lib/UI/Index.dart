import 'package:apphorario/resources/CustomClipper.dart';
import 'package:apphorario/resources/FooterCliper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_animations/simple_animations.dart';

class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  DateTime now = DateTime.now();
  DateFormat date;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    date = DateFormat.EEEE('es');
  }

  @override
  Widget build(BuildContext context) {
    final an = MultiTrackTween([
      Track("opacity").add(
        Duration(milliseconds: 400),
        Tween<double>(begin: 0, end: 1),
      ),
      Track("in").add(
        Duration(milliseconds: 800),
        Tween<double>(begin: 30, end: 0),
        curve: Curves.easeOut,
      )
    ]);

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomClipperShape(),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(57, 109, 176, 1),
                  Color.fromRGBO(3, 46, 123, 1),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ControlledAnimation(
                        duration: an.duration,
                        tween: an,
                        child: Text(
                          date.format(now).toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        builderWithChild: (context, child, animation) =>
                            Opacity(
                          opacity: animation["opacity"],
                          child: Transform.translate(
                            offset: Offset(0, animation["in"]),
                            child: child,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: ClipPath(
            clipper: FooterCliper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(57, 109, 176, 1),
                    Color.fromRGBO(3, 46, 123, 1),
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                ),                
              ),
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
        ),
      ],
    );
  }
}
