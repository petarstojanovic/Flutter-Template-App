import 'dart:async';

import 'package:template/database/database_helper.dart';
import 'package:template/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:template/screens/main_screen.dart';
import 'package:template/utils/consts.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var timeout = const Duration(seconds: 2);
  var ms = const Duration(milliseconds: 1);
  DatabaseHelper db = new DatabaseHelper();
  bool gone = false;

  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }


  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    var isLoggedIn = await db.isLoggedIn();
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: isLoggedIn ? MainScreen() : LoginScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
//        mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.icons,
              color: Theme.of(context).accentColor,
              size: 70,
            ),
            SizedBox(height: 20,),
            Text(
              "${Constants.appName}",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
