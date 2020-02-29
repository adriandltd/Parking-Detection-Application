import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io';

import 'package:parking_detection_application/home.dart';

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
  var personalemailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var passwordCtrl2 = TextEditingController();
  var businessemailCtrl = TextEditingController();
  var websiteCtrl = TextEditingController();
  var cityCtrl = TextEditingController();
  var stateCtrl = TextEditingController();
  var zipCtrl = TextEditingController();

  AnimationController _listscalecontroller;
  AnimationController _logogscalecontroller;
  AnimationController _signupscalecontroller;
  AnimationController _fnamescalecontroller;
  AnimationController _lnamescalecontroller;
  AnimationController _emailscalecontroller;
  AnimationController _pass1scalecontroller;
  AnimationController _pass2scalecontroller;
  AnimationController _bemailscalecontroller;
  AnimationController _webscalecontroller;
  AnimationController _cityscalecontroller;
  AnimationController _statescalecontroller;
  AnimationController _zipscalecontroller;
  AnimationController _continuescalecontroller;

  signupwidget() {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 1.45,
          center: Alignment.center,
          stops: [.33, .66, .99],
          colors: [
            // Color.fromRGBO(255, 212, 109, 1),
            // Color.fromRGBO(255, 200, 70, 1),
            Color.fromRGBO(80, 160, 244, 1),
            Color.fromRGBO(68, 140, 244, 1),
            Color.fromRGBO(66, 134, 244, 1),
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
                        top: deviceSize.height * 0.2,
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
                        iconSize: deviceSize.width * 0.14,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        left: deviceSize.width * 0.11,
                      )),
                      ScaleTransition(
                        scale: Tween(begin: .7, end: 1.0).animate(
                            CurvedAnimation(
                                curve: Curves.bounceOut,
                                parent: _logogscalecontroller)),
                        child: Center(
                          child: Image.asset('assets/komi logo april 2019.png',
                              scale: determineScaleFactor(),
                              alignment: Alignment.center),
                        ),
                      ),
                    ],
                  ),
                ),
                ScaleTransition(
                  scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.bounceOut, parent: _signupscalecontroller)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        letterSpacing: 2.8,
                        height: .2,
                        color: Colors.white,
                        fontSize: deviceSize.width * 0.085,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'AvenirNext'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.width * 0.1,
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
                            color: Colors.white54,
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
                  top: deviceSize.height * 0.02,
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
                            color: Colors.white54,
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
                  top: deviceSize.height * 0.02,
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
                        hintText: 'Personal Email',
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: personalemailCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context)
                            .requestFocus(textFourthFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
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
                            color: Colors.white54,
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
                  top: deviceSize.height * 0.02,
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
                            color: Colors.white54,
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
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
                )),
                ScaleTransition(
                  scale: Tween(begin: .4, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate,
                      parent: _bemailscalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textSixthFocusNode,
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
                        hintText: 'Business Email (optional)',
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: businessemailCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context)
                            .requestFocus(textSeventhFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
                )),
                ScaleTransition(
                  scale: Tween(begin: .35, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _webscalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textSeventhFocusNode,
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
                        hintText: 'Website (optional)',
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: websiteCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context).requestFocus(textEigthFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
                )),
                ScaleTransition(
                  scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _cityscalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textEigthFocusNode,
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
                        hintText: 'City (optional)',
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: cityCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context).requestFocus(textNinthFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
                )),
                ScaleTransition(
                  scale: Tween(begin: .25, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _statescalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textNinthFocusNode,
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
                        hintText: 'State (optional)',
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: stateCtrl,
                      onSubmitted: (nameCtrl) {
                        FocusScope.of(context).requestFocus(textTenthFocusNode);
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  top: deviceSize.height * 0.02,
                )),
                ScaleTransition(
                  scale: Tween(begin: .2, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate, parent: _zipscalecontroller)),
                  child: Container(
                    width: deviceSize.width * 0.7,
                    child: TextField(
                      focusNode: textTenthFocusNode,
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
                        hintText: 'Zip (optional)',
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: deviceSize.height * 0.025,
                            fontFamily: 'AvenirNext'),
                      ),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: zipCtrl,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: deviceSize.height * 0.06)),
                ScaleTransition(
                  scale: Tween(begin: .15, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.decelerate,
                      parent: _continuescalecontroller)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        HapticFeedback.vibrate();
                        signUpWithEmail(context);
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.white,
                            fontSize: deviceSize.width * 0.055,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'AvenirNext'),
                      ),
                    ),
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
            email: personalemailCtrl.text,
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
              personalemailCtrl.text.isNotEmpty) {
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
                        color: Color.fromRGBO(66, 134, 244, 1),
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
          } else if (!(personalemailCtrl.text.contains('@')) ||
              validemail == false) {
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
                  color: Color.fromRGBO(66, 134, 244, 1),
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
                  color: Color.fromRGBO(66, 134, 244, 1),
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

  FocusNode textSecondFocusNode = FocusNode();
  FocusNode textThirdFocusNode = FocusNode();
  FocusNode textFourthFocusNode = FocusNode();
  FocusNode textFifthFocusNode = FocusNode();
  FocusNode textSixthFocusNode = FocusNode();
  FocusNode textSeventhFocusNode = FocusNode();
  FocusNode textEigthFocusNode = FocusNode();
  FocusNode textNinthFocusNode = FocusNode();
  FocusNode textTenthFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _listscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _listscalecontroller.forward();

    _logogscalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _logogscalecontroller.forward();

    _signupscalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _signupscalecontroller.forward();

    _fnamescalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _fnamescalecontroller.forward();

    _lnamescalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 325));
    _lnamescalecontroller.forward();

    _emailscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 375));
    _emailscalecontroller.forward();

    _pass1scalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 475));
    _pass1scalecontroller.forward();

    _pass2scalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 550));
    _pass2scalecontroller.forward();

    _bemailscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _bemailscalecontroller.forward();

    _webscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _webscalecontroller.forward();

    _cityscalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _cityscalecontroller.forward();

    _statescalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _statescalecontroller.forward();

    _zipscalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _zipscalecontroller.forward();

    _continuescalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1100));
    _continuescalecontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 134, 244, 1),
      body: ModalProgressHUD(
        child: signupwidget(),
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
