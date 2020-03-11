import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'forgotpasswordpage.dart';
import 'home.dart';
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
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyStartUpPage>
    with TickerProviderStateMixin {
  determineScaleFactorFindMeParking() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 11.0;
    else if (deviceSize.height > 800)
      return 12.0;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 12.5;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 13.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 13.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 14.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  determineScaleFactorUTRGV() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 8.0;
    else if (deviceSize.height > 800)
      return 9.0;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 9.5;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 10.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 11.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 12.0;
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

  AnimationController _listscalecontroller;
  AnimationController _utrgvlogocontroller;
  AnimationController _findmeparkingcontroller;
  AnimationController _loginscalecontroller;
  AnimationController _emailcontroller;
  AnimationController _passcontroller;
  AnimationController _forgotcontroller;

  bool _loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();

  //Email Sign In and FireBase Authentication
  signInWithEmail(context) async {
    // marked async
    FirebaseUser user;
    try {
      setState(() {
        _loading = true;
      });
      user = await _auth.signInWithEmailAndPassword(
          email: emailCtrl.text, password: passCtrl.text);
    } catch (e) {
      print(e.toString());
    } finally {
      bool connectedToInternet;
      try {
        setState(() {
          _loading = true;
        });
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');
          connectedToInternet = true;
        }
      } on SocketException catch (_) {
        print('not connected');
        connectedToInternet = false;
      }
      Future.delayed(const Duration(milliseconds: 1300), () async {
        setState(() {
          _loading = false;
        });
        if (connectedToInternet == false) {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title: const Text(
                    'Please check your connection.',
                    style: TextStyle(
                        letterSpacing: 1.1,
                        height: 1.1,
                        fontSize: 22,
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      color: Color.fromRGBO(255, 112, 0, 1),
                      child: Text('Ok',
                          style: TextStyle(
                              letterSpacing: 1.1,
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'AvenirNext',
                              fontWeight: FontWeight.w400)),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        } else if (user != null && user.isEmailVerified) {
          //isUserSignedIn = true;
          Timestamp lastloggedin = Timestamp.now();

          FirebaseAuth.instance.currentUser().then((user) async {
            String token = user.getIdToken().toString();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('IdToken', token);
            print('token: ' + token.toString());
            Firestore.instance.collection('cards').document(user.uid).setData({
              'Last Logged In': lastloggedin,
            }, merge: true).then((val) {
              print('Instagram Info saved');
            });
          });
          HapticFeedback.vibrate();
          Navigator.of(context, rootNavigator: false).push(
            CupertinoPageRoute<bool>(
              fullscreenDialog: false,
              builder: (BuildContext context) => MyHomePage(),
            ),
          );
          emailCtrl.clear();
          passCtrl.clear();
          setState(() {
            _loading = false;
          });
        } else if (user == null ||
            emailCtrl.text.isEmpty ||
            passCtrl.text.isEmpty) {
          // sign in unsuccessful
          // ex: prompt the user to try again
          setState(() {
            _loading = false;
          });
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  titlePadding: EdgeInsets.only(top: 25, left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title: const Text(
                    'Incorrect Credentials. Please Try Again.',
                    style: TextStyle(
                        letterSpacing: 1.1,
                        height: 1.1,
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      color: Color.fromRGBO(255, 112, 0, 1),
                      child: Text('Ok',
                          style: TextStyle(
                              letterSpacing: 1.1,
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'AvenirNext',
                              fontWeight: FontWeight.w400)),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        } else if (!user.isEmailVerified) {
          // sign in unsuccessful
          // ex: prompt the user to try again
          user.sendEmailVerification();
          setState(() {
            _loading = false;
          });
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title: const Text(
                    'Please verify your email.',
                    style: TextStyle(
                        letterSpacing: 1.1,
                        height: 1.1,
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      color: Color.fromRGBO(255, 112, 0, 1),
                      child: Text('Ok',
                          style: TextStyle(
                              letterSpacing: 1.1,
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'AvenirNext',
                              fontWeight: FontWeight.w400)),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        }
      });
    }
  }

  loginwidget() {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 2.5,
          center: Alignment.topCenter,
          stops: [.15, .4, 1],
          colors: [
            Color.fromRGBO(30, 30, 30, 1),
            Color.fromRGBO(20, 20, 20, 1),
            Color.fromRGBO(0, 0, 0, 1),
            /*Color.fromRGBO(255, 170, 0, 1),
            Color.fromRGBO(255, 150, 0, 1),
            Color.fromRGBO(255, 112, 0, 1),*/
          ],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: deviceSize.width * 0.8,
          child: ScaleTransition(
            scale: Tween(begin: .75, end: 1.0).animate(CurvedAnimation(
                curve: Curves.easeOut, parent: _listscalecontroller)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.width * 0.1,
                  )),
                  ScaleTransition(
                    child: Center(
                      child: Image.asset('assets/findmeparkinglogo.png',
                          scale: determineScaleFactorFindMeParking(),
                          alignment: Alignment.topCenter),
                    ),
                    scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.bounceOut,
                        parent: _findmeparkingcontroller)),
                  ),
                  
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.width * 0.125,
                  )),
                  ScaleTransition(
                    child: Container(
                      width: deviceSize.width * 0.7,
                      child: TextField(
                        controller: emailCtrl,
                        focusNode: emailFocusNode,
                        style: TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontSize: deviceSize.height * 0.02),
                        keyboardAppearance: Brightness.light,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3.5,
                                  style: BorderStyle.solid)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid)),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white54,
                            size: 27,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: deviceSize.height * 0.025,
                              fontFamily: 'AvenirNext'),
                        ),
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                        onSubmitted: (namectrl) {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                      ),
                    ),
                    scale: Tween(begin: .4, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _emailcontroller)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.03,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _passcontroller)),
                    child: Container(
                      width: deviceSize.width * 0.7,
                      child: TextField(
                        controller: passCtrl,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: deviceSize.height * 0.02),
                        keyboardAppearance: Brightness.light,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3.5,
                                  style: BorderStyle.solid)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid)),
                          prefixIcon: const Icon(
                            Icons.vpn_key,
                            color: Colors.white54,
                            size: 27,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: deviceSize.height * 0.025,
                              fontFamily: 'AvenirNext'),
                        ),
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.07)),
                  ScaleTransition(
                      scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate,
                          parent: _loginscalecontroller)),
                      child: FlatButton(
                        color: Colors.white12,
                        padding: EdgeInsets.fromLTRB(
                            deviceSize.width * 0.001,
                            deviceSize.height * 0.001,
                            deviceSize.width * 0.001,
                            deviceSize.height * 0.001),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () => {},
                        child: OutlineButton(
                          borderSide: BorderSide(
                            color: Colors.white, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: deviceSize.width / 250, //width of the border
                          ),
                          highlightElevation: 3,
                          padding: EdgeInsets.fromLTRB(
                              deviceSize.width * 0.325,
                              deviceSize.height * 0.023,
                              deviceSize.width * 0.325,
                              deviceSize.height * 0.023),
                          disabledBorderColor: Colors.white,
                          highlightedBorderColor: Colors.white,
                          splashColor: Colors.orange,
                          highlightColor: Color.fromRGBO(255, 112, 0, 1),
                          color: Color.fromRGBO(255, 112, 0, 1),
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                letterSpacing: 1.2,
                                color: Colors.white,
                                fontSize: deviceSize.height * 0.02,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AvenirNext'),
                          ),
                          onPressed: () {
                            HapticFeedback.vibrate();
                            signInWithEmail(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.1)),
                  ScaleTransition(
                    scale: Tween(begin: .2, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _forgotcontroller)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.vibrate();
                          Navigator.of(context, rootNavigator: false).push(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (BuildContext context) =>
                                  MyForgotPasswordPage(),
                            ),
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: deviceSize.width * 0.0425,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Forgot ",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "?",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.025)),
                  ScaleTransition(
                    scale: Tween(begin: .2, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _forgotcontroller)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.vibrate();
                          Navigator.of(context, rootNavigator: false).push(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (BuildContext context) => MySignUpPage(),
                            ),
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: deviceSize.width * 0.0425,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'AvenirNext'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.09)),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        HapticFeedback.vibrate();
                        Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => MyWelcomePage(),
                          ),
                        );
                      },
                      child: Text(
                        "More Info?",
                        style: TextStyle(
                            letterSpacing: 1.1,
                            color: Colors.white70,
                            fontSize: deviceSize.width * 0.04,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'AvenirNext'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _listscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _listscalecontroller.forward();
    _findmeparkingcontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _findmeparkingcontroller.forward();
    _utrgvlogocontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _utrgvlogocontroller.forward();
    _emailcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _emailcontroller.forward();
    _passcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _passcontroller.forward();
    _loginscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _loginscalecontroller.forward();
    _forgotcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _forgotcontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: iOSAndroid(),
            sized: false,
            child: ModalProgressHUD(
              child: loginwidget(),
              inAsyncCall: _loading,
              progressIndicator: CircularProgressIndicator(
                strokeWidth: 4,
                backgroundColor: Colors.green,
              ),
              dismissible: false,
              opacity: 0.25,
              color: Colors.black45,
            ),
          )),
      onWillPop: () async => false,
    );
  }
}