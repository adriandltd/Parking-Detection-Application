import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

import 'home.dart';
import 'login.dart';
import 'signup.dart'; 
import 'welcomepage.dart';

String idToken;
Future<void> main() async {
  timeDilation = 1.5;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  idToken = prefs.getString('IdToken');
  print(idToken);
  checkifLoggedIn() {
    if (idToken == null)
      return MyStartUpApp();
    else if (idToken == 'none')
      return MyStartUpApp();
    else
      return MyStartUpApp2();
  }

  runApp(checkifLoggedIn());
}

class MyStartUpApp extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color.fromRGBO(255, 112, 0, .1),
    100: Color.fromRGBO(255, 112, 0, .2),
    200: Color.fromRGBO(255, 112, 0, .3),
    300: Color.fromRGBO(255, 112, 0, .4),
    400: Color.fromRGBO(255, 112, 0, .5),
    500: Color.fromRGBO(255, 112, 0, .6),
    600: Color.fromRGBO(255, 112, 0, .7),
    700: Color.fromRGBO(255, 112, 0, .8),
    800: Color.fromRGBO(255, 112, 0, .9),
    900: Color.fromRGBO(255, 112, 0, 1),
  };

  final MaterialColor colorCustom = MaterialColor(0xFF4286f4, color);
  setPortraitOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Widget build(BuildContext context) {
    setPortraitOrientation();
    return MaterialApp(
      title: 'Find Me Parking',
      theme: ThemeData(
        textSelectionHandleColor: Colors.grey[400],
        cursorColor: Colors.white54,
        primarySwatch: colorCustom,
      ),
      home: MyStartUpPage(),
      routes: <String, WidgetBuilder>{
        '/start': (BuildContext context) => MyStartUpPage(),
      },
    );
  }
}

class MyStartUpApp2 extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color.fromRGBO(255, 112, 0, .1),
    100: Color.fromRGBO(255, 112, 0, .2),
    200: Color.fromRGBO(255, 112, 0, .3),
    300: Color.fromRGBO(255, 112, 0, .4),
    400: Color.fromRGBO(255, 112, 0, .5),
    500: Color.fromRGBO(255, 112, 0, .6),
    600: Color.fromRGBO(255, 112, 0, .7),
    700: Color.fromRGBO(255, 112, 0, .8),
    800: Color.fromRGBO(255, 112, 0, .9),
    900: Color.fromRGBO(255, 112, 0, 1),
  };

  final MaterialColor colorCustom = MaterialColor(0xFF4286f4, color);
  setPortraitOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Widget build(BuildContext context) {
    setPortraitOrientation();
    return MaterialApp(
      title: 'Find Me Parking',
      theme: ThemeData(
        textSelectionHandleColor: Colors.grey[400],
        cursorColor: Colors.white54,
        primarySwatch: colorCustom,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/start': (BuildContext context) => MyStartUpPage(),
      },
    );
  }
}

class MyStartUpPage extends StatefulWidget {
  MyStartUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyStartUpPageState createState() => _MyStartUpPageState();
}

class _MyStartUpPageState extends State<MyStartUpPage> {
  determineScaleFactorFindMeParking() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 3.0;
    else if (deviceSize.height > 800)
      return 4.0;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 4.5;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 5.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 5.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 6.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  determineScaleFactorUTRGV() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 7.0;
    else if (deviceSize.height > 800)
      return 8.0;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 8.5;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 9.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 9.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 10.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  iOSAndroid() {
    if (Platform.isIOS) {
      return SystemUiOverlayStyle(
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent);
    } else if (Platform.isAndroid) {
      return SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent);
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return WillPopScope(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: iOSAndroid(),
            sized: false,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.65,
                  center: Alignment.center,
                  stops: [.25, .4, 1],
                  colors: [
                    Color.fromRGBO(255, 185, 25, 1),
                    Color.fromRGBO(255, 165, 10, 1),
                    Color.fromRGBO(255, 112, 0, 1),
                  ],
                ),
              ),
              height: deviceSize.height,
              width: deviceSize.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(top: deviceSize.height * .17)),
                      Image.asset('assets/findmeparkinglogo.png',
                          scale: determineScaleFactorFindMeParking(),
                          alignment: Alignment.topCenter),
                      Padding(
                          padding: EdgeInsets.only(
                        top: deviceSize.height * 0.0035,
                      )),
                      Image.asset(
                        'assets/utrgv-logo.png',
                        scale: determineScaleFactorUTRGV(),
                        alignment: Alignment.centerRight,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: deviceSize.height * 0.11)),
                      Row(
                        children: <Widget>[
                          OutlineButton(
                            borderSide: BorderSide(
                              color: Colors.white, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width:
                                  deviceSize.width / 125, //width of the border
                            ),
                            highlightElevation: 6,
                            padding: EdgeInsets.fromLTRB(
                                deviceSize.height * 0.04,
                                deviceSize.height * 0.05,
                                deviceSize.height * 0.04,
                                deviceSize.height * 0.05),
                            disabledBorderColor: Colors.white,
                            highlightedBorderColor: Colors.white,
                            splashColor: Colors.green[400],
                            highlightColor: Colors.green,
                            color: Colors.green,
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceSize.height / 33.83,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'AvenirNext'),
                            ),
                            onPressed: () {
                              HapticFeedback.vibrate();
                              Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute<bool>(
                                  builder: (BuildContext context) =>
                                      MyLoginPage(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: deviceSize.width / 9.375)),
                          OutlineButton(
                            borderSide: BorderSide(
                              color: Colors.white, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width:
                                  deviceSize.width / 125, //width of the border
                            ),
                            highlightElevation: 6,
                            padding: EdgeInsets.fromLTRB(
                                deviceSize.height * 0.028,
                                deviceSize.height * 0.05,
                                deviceSize.height * 0.028,
                                deviceSize.height * 0.05),
                            disabledBorderColor: Colors.white,
                            highlightedBorderColor: Colors.white,
                            splashColor: Colors.green[400],
                            highlightColor: Colors.green,
                            color: Colors.green,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceSize.height / 33.83,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'AvenirNext'),
                            ),
                            onPressed: () {
                              HapticFeedback.vibrate();
                              Navigator.of(context, rootNavigator: false).push(
                                CupertinoPageRoute<bool>(
                                  builder: (BuildContext context) =>
                                      MySignUpPage(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ],
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: deviceSize.height * 0.27)),
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.vibrate();
                          Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) =>
                                  MyWelcomePage(),
                            ),
                          );
                        },
                        child: Text(
                          "More Info?",
                          style: TextStyle(
                              letterSpacing: 1.1,
                              color: Colors.white70,
                              fontSize: deviceSize.width * 0.045,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'AvenirNext'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      onWillPop: () async => false,
    );
  }
}
