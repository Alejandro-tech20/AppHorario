import 'package:apphorario/resources/CustomClipper.dart';
import 'package:apphorario/resources/CustomIcons.dart';
import 'package:apphorario/resources/FooterCliper.dart';
import 'package:apphorario/resources/RouteName.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'LoginSocialIcons.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  DateTime now = DateTime.now();
  // GoogleSignInAccount _currentUser;
  DateFormat date;
  bool _isSelected = false;

  void _select() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

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
                          fontFamily: "Poppins-Bold",
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
                SizedBox(
                  height: ScreenUtil().setHeight(200),
                ),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(800),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 10.0,
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -8.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(45),
                            fontFamily: 'Poppins-Bold',
                            letterSpacing: .6,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(28),
                        ),
                        Text(
                          'Username:',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            fontFamily: 'Poppins-Bold',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'username',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setSp(30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            fontFamily: 'Poppins-Bold',
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'username',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setSp(30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(75),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: ScreenUtil().setSp(32),
                                fontFamily: 'Poppins-Bold',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(12),
                        ),
                        GestureDetector(
                          onTap: _select,
                          child: Container(
                            width: ScreenUtil().setWidth(46),
                            height: ScreenUtil().setHeight(46),
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.0,
                                color: Colors.black,
                              ),
                            ),
                            child: _isSelected
                                ? Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(15),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            fontFamily: 'Poppins-Bold',
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(120),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black12,
                              Colors.black26,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              offset: Offset(0.0, 8.0),
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, RouteName.expenses);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Signin',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(30),
                                  fontFamily: 'Poppins-Blond',
                                ),
                              ),
                              Icon(
                                Icons.supervised_user_circle,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: ScreenUtil().setWidth(820),
                        height: 1,
                        color: Colors.black26.withOpacity(.2),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Social Login',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25),
                    fontFamily: 'Poppins-Medium',
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LoginSocialIcons(
                      colors: [
                        Color(0xFF102397),
                        Color(0xFF187adf),
                        Color(0xFF00eaf8),
                      ],
                      icon: CustomIcons.facebook,
                    ),
                    LoginSocialIcons(
                      colors: [
                        Color(0xFF17ead9),
                        Color(0xFF6078ea),
                      ],
                      icon: CustomIcons.twitter,
                    ),
                    LoginSocialIcons(
                      colors: [
                        Color(0xFFff4f38),
                        Color(0xFFff355d),
                      ],
                      icon: CustomIcons.googlePlus,
                    ),
                    LoginSocialIcons(
                      colors: [
                        Color(0xFF00c6fb),
                        Color(0xFF005bea),
                      ],
                      icon: CustomIcons.linkedin,
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(45),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New User ?',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(34),
                        fontFamily: 'Poppins-Bold',
                        color: Colors.orange,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RouteName.expenses);
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          color: Color(0xFF5d74e3),
                          fontFamily: 'Poppins-Bold',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        

        //
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

 

  // Widget buidLogin() {
  //   if (_currentUser != null) {
  //     return Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           ListTile(
  //             leading: GoogleUserCircleAvatar(
  //               identity: _currentUser,
  //             ),
  //             title: Text(_currentUser.displayName ?? ''),
  //             subtitle: Text(_currentUser.email ?? ''),
  //           ),
  //           RaisedButton(
  //             onPressed: _handleSingOut,
  //             child: Text('SingOut'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     return Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           RaisedButton(
  //             onPressed: (){
  //               Navigator.pushReplacementNamed(context, RouteName.expenses);
  //             }, //_handleSingIn,
  //             child: Text('Login'),
  //           ),
  //           Text('data'),
  //         ],
  //       ),
  //     );
  //   }
  // }

//   void _handleSingOut() {
//     _googleSignIn.disconnect();
//   }

//   Future<void> _handleSingIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (er) {
//       print(er);
//     }
//   }
}
