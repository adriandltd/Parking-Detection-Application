import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgotpasswordpage.dart';
import 'home.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage();
  @override
  _MyLoginPage createState() {
    return new _MyLoginPage();
  }
}

class _MyLoginPage extends State<MyLoginPage> with TickerProviderStateMixin {
  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 6.5;
    else if (deviceSize.height > 800)
      return 7.5;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 8.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 9.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 9.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 10.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  AnimationController _listscalecontroller;
  AnimationController _welcomescalecontroller;
  AnimationController _logoscalecontroller;
  AnimationController _loginscalecontroller;
  AnimationController _emailcontroller;
  AnimationController _passcontroller;
  AnimationController _forgotcontroller;
  bool _loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();
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
                      color: Color.fromRGBO(66, 134, 244, 1),
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
                      color: Color.fromRGBO(66, 134, 244, 1),
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
                      color: Color.fromRGBO(66, 134, 244, 1),
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
    var textSecondFocusNode;
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: .75,
          center: Alignment.center,
          stops: [.25, .45, .85, 1],
          colors: [
            // Color.fromRGBO(255, 212, 109, 1),
            // Color.fromRGBO(255, 200, 70, 1),
            Color.fromRGBO(255, 160, 0, 1),
            Color.fromRGBO(255, 140, 0, 1),
            Color.fromRGBO(255, 120, 0, 1),
            Color.fromRGBO(255, 112, 0, 1),
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                          top: deviceSize.height * 0.15,
                        )),
                        IconButton(
                          onPressed: () {
                            HapticFeedback.vibrate();
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          iconSize: deviceSize.height * 0.065,
                        ),
                      ],
                    ),
                  ),
                  ScaleTransition(
                    child: Center(
                      child: Image.asset('assets/komi logo april 2019.png',
                          scale: determineScaleFactor(),
                          alignment: Alignment.center),
                    ),
                    scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.bounceOut, parent: _logoscalecontroller)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.width * 0.02,
                  )),
                  ScaleTransition(
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                          letterSpacing: 2.8,
                          color: Colors.white,
                          fontSize: deviceSize.width * 0.08,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'AvenirNext'),
                      textAlign: TextAlign.center,
                    ),
                    scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.bounceOut,
                        parent: _welcomescalecontroller)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.width * 0.06,
                  )),
                  ScaleTransition(
                    child: Container(
                      width: deviceSize.width * 0.7,
                      child: TextField(
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
                        controller: emailCtrl,
                        onSubmitted: (emailCtrl) {
                          FocusScope.of(context)
                              .requestFocus(textSecondFocusNode);
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
                        focusNode: textSecondFocusNode,
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
                        controller: passCtrl,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.07)),
                  ScaleTransition(
                    scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate,
                        parent: _loginscalecontroller)),
                    child: OutlineButton(
                      borderSide: BorderSide(
                        color: Colors.white, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: deviceSize.width / 150, //width of the border
                      ),
                      highlightElevation: 3,
                      padding: EdgeInsets.fromLTRB(
                          deviceSize.width * 0.25,
                          deviceSize.height * 0.023,
                          deviceSize.width * 0.25,
                          deviceSize.height * 0.023),
                      disabledBorderColor: Colors.white,
                      highlightedBorderColor: Colors.white,
                      splashColor: Colors.green,
                      highlightColor: Colors.green,
                      color: Colors.green,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.white,
                            fontSize: deviceSize.height * 0.02,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'AvenirNext'),
                      ),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        signInWithEmail(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.06)),
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
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: deviceSize.width * 0.04,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'AvenirNext'),
                        ),
                      ),
                    ),
                  ),
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
    _logoscalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _logoscalecontroller.forward();
    _welcomescalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _welcomescalecontroller.forward();
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 112, 0, 1),
      body: ModalProgressHUD(
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
    );
  }
}
