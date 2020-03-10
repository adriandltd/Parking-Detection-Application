import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io';
import 'home.dart';

class MySignUpPage extends StatefulWidget {
  MySignUpPage();
  @override
  _MySignUpPage createState() {
    return new _MySignUpPage();
  }
}

class _MySignUpPage extends State<MySignUpPage> with TickerProviderStateMixin {
  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 9.5;
    else if (deviceSize.height > 800)
      return 10.5;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 11.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 12.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 13.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 14.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  bool _loading = false;
  var firstNameCtrl = TextEditingController();
  var lastNameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var passwordCtrl2 = TextEditingController();

  AnimationController _listscalecontroller;
  AnimationController _logogscalecontroller;
  AnimationController _signupscalecontroller;
  AnimationController _fnamescalecontroller;
  AnimationController _lnamescalecontroller;
  AnimationController _emailscalecontroller;
  AnimationController _pass1scalecontroller;
  AnimationController _pass2scalecontroller;
  AnimationController _continuescalecontroller;

  FocusNode textSecondFocusNode = FocusNode();
  FocusNode textThirdFocusNode = FocusNode();
  FocusNode textFourthFocusNode = FocusNode();
  FocusNode textFifthFocusNode = FocusNode();
  FocusNode textSixthFocusNode = FocusNode();
  FocusNode textSeventhFocusNode = FocusNode();
  FocusNode textEigthFocusNode = FocusNode();
  FocusNode textNinthFocusNode = FocusNode();
  FocusNode textTenthFocusNode = FocusNode();
  signupwidget() {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 1.25,
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
      child: ScaleTransition(
        scale: Tween(begin: .75, end: 1.0).animate(CurvedAnimation(
            curve: Curves.easeOut, parent: _listscalecontroller)),
        child: Center(
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
                        top: deviceSize.height * 0.125,
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
                      curve: Curves.decelerate, parent: _logogscalecontroller)),
                  child: Center(
                    child: Image.asset('assets/findmeparkingicon.png',
                        scale: determineScaleFactor(),
                        alignment: Alignment.center),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.05,
                )),
                ScaleTransition(
                  scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate,
                      parent: _signupscalecontroller)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        letterSpacing: 2.8,
                        height: .2,
                        color: Colors.white,
                        fontSize: deviceSize.width * 0.085,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'AvenirNext'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.width * 0.05,
                )),
                ScaleTransition(
                  scale: Tween(begin: .65, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _fnamescalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context)
                            .requestFocus(textSecondFocusNode);
                      },
                      obscureText: false,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: deviceSize.height * 0.02),
                      keyboardAppearance: Brightness.light,
                      decoration: InputDecoration(
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 4.0,
                                style: BorderStyle.solid)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 4.0,
                                style: BorderStyle.solid)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                                style: BorderStyle.solid)),
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.words,
                      autocorrect: false,
                      controller: firstNameCtrl,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.04,
                )),
                ScaleTransition(
                  scale: Tween(begin: .6, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _lnamescalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textSecondFocusNode,
                      obscureText: false,
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
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.words,
                      autocorrect: false,
                      controller: lastNameCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context).requestFocus(textThirdFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.04,
                )),
                ScaleTransition(
                  scale: Tween(begin: .55, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _emailscalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textThirdFocusNode,
                      obscureText: false,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: deviceSize.height * 0.02),
                      keyboardAppearance: Brightness.light,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 4.0,
                                style: BorderStyle.solid)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                                style: BorderStyle.solid)),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: emailCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context)
                            .requestFocus(textFourthFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.04,
                )),
                ScaleTransition(
                  scale: Tween(begin: .5, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _pass1scalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textFourthFocusNode,
                      obscureText: true,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: deviceSize.height * 0.02),
                      keyboardAppearance: Brightness.light,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 4.0,
                                style: BorderStyle.solid)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                                style: BorderStyle.solid)),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: passwordCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context).requestFocus(textFifthFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.04,
                )),
                ScaleTransition(
                  scale: Tween(begin: .45, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _pass2scalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textFifthFocusNode,
                      obscureText: true,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: deviceSize.height * 0.02),
                      keyboardAppearance: Brightness.light,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 4.0,
                                style: BorderStyle.solid)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                                style: BorderStyle.solid)),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: passwordCtrl2,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context).requestFocus(textSixthFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: deviceSize.height * 0.055)),
                ScaleTransition(
                  scale: Tween(begin: .15, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate,
                      parent: _continuescalecontroller)),
                  child: OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.white, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: deviceSize.width / 250, //width of the border
                    ),
                    highlightElevation: 3,
                    padding: EdgeInsets.fromLTRB(
                        deviceSize.width * 0.31,
                        deviceSize.height * 0.023,
                        deviceSize.width * 0.31,
                        deviceSize.height * 0.023),
                    disabledBorderColor: Colors.white,
                    highlightedBorderColor: Colors.white,
                    splashColor: Colors.green,
                    highlightColor: Colors.green,
                    color: Colors.green,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: deviceSize.height * 0.022,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'AvenirNext'),
                    ),
                    onPressed: () async {
                      HapticFeedback.vibrate();
                      signUpWithEmail(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Email Sign Up and FireBase Authentication
  void signUpWithEmail(context) async {
    // marked async
    FirebaseAuth _auth = FirebaseAuth.instance;
    bool accountexists = false;
    bool validemail = true;
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
    Future.delayed(const Duration(milliseconds: 1200), () async {
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
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                      setState(() {
                        _loading = false;
                      });
                    },
                  ),
                ],
              );
            });
      } else if (passwordCtrl.text == passwordCtrl2.text &&
          passwordCtrl.text.length > 5 &&
          passwordCtrl2.text.length > 5 &&
          firstNameCtrl.text.isNotEmpty &&
          lastNameCtrl.text.isNotEmpty &&
          connectedToInternet) {
        try {
          await _auth.createUserWithEmailAndPassword(
            email: emailCtrl.text,
            password: passwordCtrl.text,
          );
        } catch (e) {
          if (e.toString().contains("ERROR_EMAIL_ALREADY_IN_USE")) {
            accountexists = true;
          }
          if (e.toString().contains("ERROR_INVALID_EMAIL") ||
              e.toString().contains("Given String is empty or null")) {
            validemail = false;
          }
          print(e.toString());
        } finally {
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
                          setState(() {
                            _loading = false;
                          });
                        },
                      ),
                    ],
                  );
                });
          }
          if ((accountexists == false) &&
              (validemail == true) &&
              firstNameCtrl.text.isNotEmpty &&
              lastNameCtrl.text.isNotEmpty &&
              emailCtrl.text.isNotEmpty) {
            FirebaseAuth.instance.currentUser().then((val) {
              UserUpdateInfo updateUser = UserUpdateInfo();
              updateUser.displayName =
                  firstNameCtrl.text + " " + lastNameCtrl.text;
              //updateUser.photoUrl = picURL;
              val.updateProfile(updateUser);
            });
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    title: const Text(
                      'Sucessfully Registered!',
                      style: TextStyle(
                          letterSpacing: 1.1,
                          height: 1.1,
                          color: Colors.black87,
                          fontSize: 22,
                          fontFamily: 'AvenirNext',
                          fontWeight: FontWeight.w500),
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
                                letterSpacing: 1.1, color: Colors.white)),
                        onPressed: () {
                          HapticFeedback.vibrate();
                          Navigator.of(context).pop();
                          setState(() {
                            _loading = false;
                          });
                          Navigator.of(context, rootNavigator: false).push(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: false,
                              builder: (BuildContext context) => MyHomePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                });
          } else if (!(emailCtrl.text.contains('@')) || validemail == false) {
            print("email/password invalid");
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title: const Text(
                    'Please provide a valid email.',
                    style: TextStyle(
                        letterSpacing: 1.1,
                        height: 1.1,
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w500),
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
                        setState(() {
                          _loading = false;
                        });
                      },
                    ),
                  ],
                );
              },
            );
          } else if (accountexists == true) {
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    title: const Text(
                      'Email already taken.',
                      style: TextStyle(
                          letterSpacing: 1.1,
                          height: 1.1,
                          fontSize: 22,
                          color: Colors.black87,
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
                          setState(() {
                            _loading = false;
                          });
                        },
                      ),
                    ],
                  );
                });
          }
        }
      } else if (firstNameCtrl.text.isEmpty || lastNameCtrl.text.isEmpty) {
        print("first/last name empty");
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: EdgeInsets.only(top: 45, left: 10, right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: const Text(
                'First/Last name field is empty.',
                style: TextStyle(
                    letterSpacing: 1.1,
                    height: 1.1,
                    fontSize: 22,
                    fontFamily: 'AvenirNext',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Color.fromRGBO(255, 112, 0, 1),
                  child: Text('Ok',
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontSize: 14,
                          fontFamily: 'AvenirNext',
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  onPressed: () {
                    HapticFeedback.vibrate();
                    Navigator.of(context).pop();
                    setState(() {
                      _loading = false;
                    });
                  },
                ),
              ],
            );
          },
        );
      } else if (passwordCtrl.text != passwordCtrl2.text) {
        print("password invalid");
        return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: const Text(
                'Passwords do not match.',
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                    setState(() {
                      _loading = false;
                    });
                  },
                ),
              ],
            );
          },
        );
      } else if (passwordCtrl.text.length < 6 ||
          passwordCtrl2.text.length < 6) {
        print("password too short");
        return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: const Text(
                'Password must be at least 6 characters long.',
                style: TextStyle(
                    letterSpacing: 1.1,
                    height: 1.1,
                    fontSize: 22,
                    fontFamily: 'AvenirNext',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Color.fromRGBO(255, 112, 0, 1),
                  child: Text('Ok',
                      style: TextStyle(
                          letterSpacing: 1.1,
                          fontSize: 14,
                          fontFamily: 'AvenirNext',
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  onPressed: () {
                    HapticFeedback.vibrate();
                    Navigator.of(context).pop();
                    setState(() {
                      _loading = false;
                    });
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    _listscalecontroller.forward();

    _logogscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _logogscalecontroller.forward();

    _signupscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 425));
    _signupscalecontroller.forward();

    _fnamescalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 475));
    _fnamescalecontroller.forward();

    _lnamescalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 550));
    _lnamescalecontroller.forward();

    _emailscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    _emailscalecontroller.forward();

    _pass1scalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _pass1scalecontroller.forward();

    _pass2scalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 850));
    _pass2scalecontroller.forward();

    _continuescalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _continuescalecontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 112, 0, 1),
      body: ModalProgressHUD(
        child: signupwidget(),
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
