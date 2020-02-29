import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:parking_detection_application/home.dart';
import 'package:parking_detection_application/login.dart';
import 'package:parking_detection_application/signup.dart';
import 'package:parking_detection_application/welcomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;
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
    50: Color.fromRGBO(66, 134, 244, .1),
    100: Color.fromRGBO(66, 134, 244, .2),
    200: Color.fromRGBO(66, 134, 244, .3),
    300: Color.fromRGBO(66, 134, 244, .4),
    400: Color.fromRGBO(66, 134, 244, .5),
    500: Color.fromRGBO(66, 134, 244, .6),
    600: Color.fromRGBO(66, 134, 244, .7),
    700: Color.fromRGBO(66, 134, 244, .8),
    800: Color.fromRGBO(66, 134, 244, .9),
    900: Color.fromRGBO(66, 134, 244, 1),
  };

  final MaterialColor colorCustom = MaterialColor(0xFF4286f4, color);
  setPortraitOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Widget build(BuildContext context) {
    setPortraitOrientation();
    return MaterialApp(
      title: 'Komi Social',
      theme: ThemeData(
        textSelectionHandleColor: Colors.grey[400],
        cursorColor: Colors.white54,
        primarySwatch: colorCustom,
      ),
      home: MyStartUpPage(),
      routes: <String, WidgetBuilder> {
      '/start': (BuildContext context) => MyStartUpPage(),
    },
    );
  }
}
class MyStartUpApp2 extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color.fromRGBO(66, 134, 244, .1),
    100: Color.fromRGBO(66, 134, 244, .2),
    200: Color.fromRGBO(66, 134, 244, .3),
    300: Color.fromRGBO(66, 134, 244, .4),
    400: Color.fromRGBO(66, 134, 244, .5),
    500: Color.fromRGBO(66, 134, 244, .6),
    600: Color.fromRGBO(66, 134, 244, .7),
    700: Color.fromRGBO(66, 134, 244, .8),
    800: Color.fromRGBO(66, 134, 244, .9),
    900: Color.fromRGBO(66, 134, 244, 1),
  };

  final MaterialColor colorCustom = MaterialColor(0xFF4286f4, color);
  setPortraitOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Widget build(BuildContext context) {
    setPortraitOrientation();
    return MaterialApp(
      title: 'Komi Social',
      theme: ThemeData(
        textSelectionHandleColor: Colors.grey[400],
        cursorColor: Colors.white54,
        primarySwatch: colorCustom,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder> {
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
  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 7.5;
    else if (deviceSize.height > 800)
      return 6.5;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 7.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 8.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 8.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 9.0;
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
          backgroundColor: Color.fromRGBO(66, 134, 244, 1),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: iOSAndroid(),
            sized: false,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: .9,
                  center: Alignment.center,
                  stops: [.25, .45, .85, 1],
                  colors: [
                    // Color.fromRGBO(255, 212, 109, 1),
                    // Color.fromRGBO(255, 200, 70, 1),
                    Color.fromRGBO(84, 164, 244, 1),
                    Color.fromRGBO(78, 158, 244, 1),
                    Color.fromRGBO(68, 140, 244, 1),
                    Color.fromRGBO(66, 134, 244, 1),
                  ],
                ),
              ),
              height: deviceSize.height,
              width: deviceSize.width,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding:
                                EdgeInsets.only(top: deviceSize.height * .2)),
                        Image.asset('assets/komi social white.png',
                            scale: determineScaleFactor(),
                            alignment: Alignment.topCenter),
                        Padding(
                            padding:
                                EdgeInsets.only(top: deviceSize.height / 7.73)),
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
                              splashColor: Colors.blue[400],
                              highlightColor: Colors.blue,
                              color: Color.fromRGBO(66, 134, 244, 1),
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
                              splashColor: Colors.blue[400],
                              highlightColor: Colors.blue,
                              color: Color.fromRGBO(66, 134, 244, 1),
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
                                EdgeInsets.only(top: deviceSize.height * 0.19)),
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
                            "New to Komi?",
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
            ),
          )), onWillPop: () async => false,
    );
  }
}
