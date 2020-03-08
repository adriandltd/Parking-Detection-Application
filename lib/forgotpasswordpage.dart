import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyForgotPasswordPage extends StatefulWidget {
  MyForgotPasswordPage();
  @override
  _MyForgotPasswordPage createState() {
    return new _MyForgotPasswordPage();
  }
}

class _MyForgotPasswordPage extends State<MyForgotPasswordPage>
    with TickerProviderStateMixin {
  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 5.5;
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

  AnimationController _listscalecontroller;
  AnimationController _welcomescalecontroller;
  AnimationController _logoscalecontroller;
  AnimationController _emailcontroller;
  AnimationController _loginscalecontroller;
  var emailCtrl = TextEditingController();

  bool _loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  fpwidget() {
    var deviceSize = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: .62,
            center: Alignment.center,
            stops: [.25, .45, .85, 1],
          colors: [
            Color.fromRGBO(255, 160, 0, 1),
            Color.fromRGBO(255, 140, 0, 1),
            Color.fromRGBO(255, 120, 0, 1),
            Color.fromRGBO(255, 112, 0, 1),
            ],
          ),
        ),
        height: deviceSize.height,
        width: deviceSize.width,
        child: Center(
            child: ScaleTransition(
          scale: Tween(begin: .75, end: 1.0).animate(CurvedAnimation(
              curve: Curves.easeOut, parent: _listscalecontroller)),
          child: Container(
            width: deviceSize.width * 0.8,
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                        top: deviceSize.height * 0.1,
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
                  scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.bounceOut, parent: _logoscalecontroller)),
                  child: Center(
                    child: Image.asset('assets/komi logo april 2019.png',
                        scale: determineScaleFactor(),
                        alignment: Alignment.center),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
                )),
                ScaleTransition(
                    child: Center(
                      child: Text(
                        "Password Reset",
                        style: TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontSize: deviceSize.height * 0.04,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AvenirNext'),
                      ),
                    ),
                    scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.bounceOut,
                        parent: _welcomescalecontroller))),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.04,
                )),
                ScaleTransition(
                  scale: Tween(begin: .4, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _emailcontroller)),
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
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: deviceSize.height * 0.07)),
                ScaleTransition(
                  scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _loginscalecontroller)),
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
                      "Reset",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: deviceSize.height * 0.022,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'AvenirNext'),
                    ),
                    onPressed: () async {
                      HapticFeedback.vibrate();
                      setState(() {
                        _loading = true;
                      });
                      bool connectedToInternet;
                      try {
                        setState(() {
                          _loading = true;
                        });
                        final result =
                            await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty &&
                            result[0].rawAddress.isNotEmpty) {
                          print('connected');
                          connectedToInternet = true;
                        }
                      } on SocketException catch (_) {
                        print('not connected');
                        connectedToInternet = false;
                      }
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        sendPasswordResetEmail(emailCtrl.text);
                        setState(() {
                          _loading = false;
                        });
                        if (connectedToInternet == false) {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: EdgeInsets.only(
                                      top: 35, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
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
                        } else if (emailCtrl.text.contains('@') &&
                            emailCtrl.text.isNotEmpty) {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: EdgeInsets.only(
                                      top: 35, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  title: const Text(
                                    'Password reset link has been sent to the submitted email.',
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
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
                        } else {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: EdgeInsets.only(
                                      top: 35, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  title: const Text(
                                    'Please provide a valid email.',
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
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
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            ),
          ),
        )));
  }

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
    _loginscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _loginscalecontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 112, 0, 1),
      body: ModalProgressHUD(
        child: fpwidget(),
        inAsyncCall: _loading,
        progressIndicator: CircularProgressIndicator(
          strokeWidth: 4,
          backgroundColor: Colors.white54,
        ),
        dismissible: false,
        opacity: 0.25,
        color: Colors.black45,
      ),
    );
  }
}
