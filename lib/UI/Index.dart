import 'package:apphorario/resources/CustomClipper.dart';
import 'package:apphorario/resources/FooterCliper.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  DateTime now = DateTime.now();
  GoogleSignInAccount _currentUser;
  DateFormat date;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    date = DateFormat.EEEE('es');
    // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
    //   setState(() {
    //     _currentUser = account;
    //   });
    // });
    // _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {    
  ScreenUtil.init(context, allowFontScaling: true);
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

    // return buidLogin();

    return Stack(
      fit: StackFit.expand,
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      // color: Colors.blue.withAlpha(100),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: ClipPath(
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
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 28.0, top: 60.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    ControlledAnimation(
                      duration: an.duration,
                      tween: an,
                      child: Text(
                        date.format(now).toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: .8,
                          fontSize: ScreenUtil().setSp(46),
                        ),
                      ),
                      builderWithChild: (context, child, animation) => Opacity(
                        opacity: animation["opacity"],
                        child: Transform.translate(
                          offset: Offset(0, animation["in"]),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                ),
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
        // Container(
        //   child:Stack(
        //     children: <Widget>[
        //       ListTile(
        //         leading: GoogleUserCircleAvatar(
        //           identity: _currentUser,
        //         ),
        //         title: Text('data'),
        //         subtitle: Text('data2222'),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }

  Widget buidLogin() {
    if (_currentUser != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: GoogleUserCircleAvatar(
                identity: _currentUser,
              ),
              title: Text(_currentUser.displayName ?? ''),
              subtitle: Text(_currentUser.email ?? ''),
            ),
            RaisedButton(
              onPressed: _handleSingOut,
              child: Text('SingOut'),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _handleSingIn,
              child: Text('Login'),
            ),
            Text('data'),
          ],
        ),
      );
    }
  }

  void _handleSingOut() {
    _googleSignIn.disconnect();
  }

  Future<void> _handleSingIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (er) {
      print(er);
    }
  }
}
