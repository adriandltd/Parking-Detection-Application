import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePage createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int page;
  Widget body;
  AnimationController _sidebarcontroller;

  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 5.0;
    else if (deviceSize.height > 800)
      return 6.0;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 6.5;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 7.5;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 8.0;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 8.5;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 4.5;
  }

  determineScaleFactor2() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 14.5;
    else if (deviceSize.height > 800)
      return 15.0;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 16.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 16.5;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 17.0;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 18.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  determineScaleFactor3() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 15.5;
    else if (deviceSize.height > 800)
      return 16.0;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 17.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 18.5;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 19.0;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 20.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      setState(() async {});
    });
    super.initState();
    _sidebarcontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3250));
    _sidebarcontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    determinePage(deviceSize);
    return WillPopScope(onWillPop: () async => false, child: body);
  }

  determinePage(deviceSize) {
    switch (page) {
      case 0:
        setState(() {
          body = _findmeparking(deviceSize);
        });
        break;
      case 1:
        setState(() {
          body = _manualselection(deviceSize);
        });
        break;
      case 2:
        setState(() {
          body = _support(deviceSize);
        });
        break;
      case 3:
        setState(() {
          body = _settings(deviceSize);
        });
        break;
      case 4:
        setState(() {
          body = _about(deviceSize);
        });
        break;
      default:
        setState(() {
          body = _findmeparking(deviceSize);
        });
    }
  }

  Widget _findmeparking(deviceSize) {
    //getUserInfo();
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          primary: true,
          elevation: 0,
          title: Image.asset(
            'assets/findmeparkinglogo.png',
            scale: determineScaleFactor(),
          )),
      drawer: _drawer(deviceSize),
      body: FindMeParkingPage(),
    );
  }

  Widget _manualselection(deviceSize) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        primary: true,
        elevation: 0,
        title: Image.asset(
          'assets/findmeparkinglogo.png',
          scale: determineScaleFactor(),
        ),
      ),
      drawer: _drawer(deviceSize),
      body: ManualSelectionPage(),
    );
  }

  Widget _support(deviceSize) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          primary: true,
          elevation: 0,
          title: Image.asset(
            'assets/findmeparkinglogo.png',
            scale: determineScaleFactor(),
          ),
        ),
        drawer: _drawer(deviceSize),
        body: SupportPage());
  }

  Widget _settings(deviceSize) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        primary: true,
        elevation: 0,
        title: Image.asset(
          'assets/findmeparkinglogo.png',
          scale: determineScaleFactor(),
        ),
      ),
      drawer: _drawer(deviceSize),
      body: Center(
        child: SettingsPage(),
      ),
    );
  }

  Widget _about(deviceSize) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        primary: true,
        elevation: 0,
        title: Image.asset(
          'assets/findmeparkinglogo.png',
          scale: determineScaleFactor(),
        ),
      ),
      drawer: _drawer(deviceSize),
      body: AboutPage(),
    );
  }

  Widget _drawer(deviceSize) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [.33, .75, 1],
            colors: [
              Color.fromRGBO(255, 112, 0, 1),
              Color.fromRGBO(255, 150, 0, 1),
              Color.fromRGBO(255, 160, 0, 1),
            ],
          ),
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: deviceSize.width * 0.125)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/utrgv-logo.png',
                  scale: determineScaleFactor2(),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: deviceSize.width * 0.05)),
            Divider(
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(
                Icons.drive_eta,
                color: Colors.grey[200],
              ),
              title: Text(
                'Find Me Parking',
                style: TextStyle(
                    height: 1,
                    color: Colors.grey[100],
                    fontSize: deviceSize.width * 0.041,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AvenirNext'),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                setState(() {
                  page = 0;
                  determinePage(deviceSize);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.grey[200],
              ),
              title: Text(
                'Manual Selection',
                style: TextStyle(
                    height: 1,
                    color: Colors.grey[100],
                    fontSize: deviceSize.width * 0.041,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AvenirNext'),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                setState(() {
                  page = 1;
                  determinePage(deviceSize);
                  Navigator.pop(context);
                });
              },
            ),
            Divider(
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(
                Icons.security,
                color: Colors.grey[200],
              ),
              title: Text(
                'Support',
                style: TextStyle(
                    height: 1,
                    color: Colors.grey[100],
                    fontSize: deviceSize.width * 0.041,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AvenirNext'),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                setState(() {
                  page = 2;
                  determinePage(deviceSize);
                  Navigator.pop(context);
                });
              },
            ),
            Divider(
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[200],
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                    height: 1,
                    color: Colors.grey[100],
                    fontSize: deviceSize.width * 0.041,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AvenirNext'),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                setState(() {
                  page = 3;
                  determinePage(deviceSize);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.grey[200],
              ),
              title: Text(
                'About',
                style: TextStyle(
                    height: 1,
                    color: Colors.grey[100],
                    fontSize: deviceSize.width * 0.041,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AvenirNext'),
              ),
              onTap: () {
                HapticFeedback.vibrate();
                setState(() {
                  page = 4;
                  determinePage(deviceSize);
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FindMeParkingPage extends StatefulWidget {
  FindMeParkingPage();
  @override
  _FindMeParkingPage createState() {
    return new _FindMeParkingPage();
  }
}

class _FindMeParkingPage extends State<FindMeParkingPage>
    with TickerProviderStateMixin {
  AnimationController _sidebarcontroller;

  _FindMeParkingPage();
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  /*RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.loadComplete();
  }*/

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [.33, .66, 1],
            colors: [
              Color.fromRGBO(30, 30, 30, 1),
              Color.fromRGBO(20, 20, 20, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
        ),
        height: deviceSize.height,
        width: deviceSize.width,
        child: Container(
            width: deviceSize.width,
            child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: deviceSize.width * 0.88,
                  child: Container(
                      child: Text(
                    "HomePage",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: deviceSize.height * 0.025,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'AvenirNext'),
                  )),
                ))));
  }
}

class ManualSelectionPage extends StatefulWidget {
  ManualSelectionPage();
  @override
  _ManualSelectionPage createState() {
    return new _ManualSelectionPage();
  }
}

class _ManualSelectionPage extends State<ManualSelectionPage>
    with TickerProviderStateMixin {
  AnimationController _audiencetargeting1controller;
  AnimationController _audiencetargeting2controller;
  AnimationController _audiencetargeting3controller;
  AnimationController _audiencetargeting4controller;

  Animation<Offset> _audiencetargetingoffsetFloat;

  @override
  void initState() {
    super.initState();

    _audiencetargeting1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _audiencetargeting1controller.forward();

    _audiencetargeting2controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    _audiencetargeting2controller.forward();
    _audiencetargeting3controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _audiencetargeting3controller.forward();

    _audiencetargeting4controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _audiencetargeting4controller.forward();

    _audiencetargetingoffsetFloat =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_audiencetargeting1controller);
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [.33, .66, 1],
          colors: [
            Color.fromRGBO(30, 30, 30, 1),
            Color.fromRGBO(20, 20, 20, 1),
            Color.fromRGBO(0, 0, 0, 1),
          ],
        ),
      ),
      height: deviceSize.height,
      width: deviceSize.width,
      child: SlideTransition(
        position: _audiencetargetingoffsetFloat,
        child: Column(
          children: <Widget>[
            ScaleTransition(
              scale: Tween(begin: .65, end: 1.0).animate(CurvedAnimation(
                  curve: Curves.decelerate,
                  parent: _audiencetargeting2controller)),
              child: Text(
                "Audience Targeting",
                style: TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: deviceSize.width * 0.09,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'AvenirNext'),
                textAlign: TextAlign.center,
              ),
            ),
            ScaleTransition(
                scale: Tween(begin: .65, end: 1.0).animate(CurvedAnimation(
                    curve: Curves.decelerate,
                    parent: _audiencetargeting2controller)),
                child: Divider(
                  color: Colors.grey[300],
                  indent: 55,
                  endIndent: 55,
                  height: 5,
                )),
            Padding(
                padding: EdgeInsets.only(
              top: deviceSize.height * 0.175,
            )),
            ScaleTransition(
              scale: Tween(begin: .4, end: 1.0).animate(CurvedAnimation(
                  curve: Curves.decelerate,
                  parent: _audiencetargeting3controller)),
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.white, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: deviceSize.width / 150, //width of the border
                ),
                highlightElevation: 3,
                padding: EdgeInsets.fromLTRB(
                    deviceSize.width * 0.12,
                    deviceSize.height * 0.025,
                    deviceSize.width * 0.12,
                    deviceSize.height * 0.025),
                disabledBorderColor: Colors.white,
                highlightedBorderColor: Colors.white,
                splashColor: Colors.blueAccent,
                highlightColor: Colors.blue,
                color: Color.fromRGBO(66, 134, 244, 1),
                child: Text(
                  "Usernames to Target",
                  style: TextStyle(
                      letterSpacing: 0.8,
                      color: Colors.white,
                      fontSize: deviceSize.width * 0.05,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'AvenirNext'),
                ),
                onPressed: () {
                  HapticFeedback.vibrate();
                  /*Navigator.of(context, rootNavigator: false).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => UsernameTargetPage(),
                    ),
                  );*/
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              top: deviceSize.height * 0.08,
            )),
            ScaleTransition(
              scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                  curve: Curves.decelerate,
                  parent: _audiencetargeting4controller)),
              child: Container(
                child: OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.white, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: deviceSize.width / 150, //width of the border
                  ),
                  highlightElevation: 3,
                  padding: EdgeInsets.fromLTRB(
                      deviceSize.width * 0.125,
                      deviceSize.height * 0.024,
                      deviceSize.width * 0.125,
                      deviceSize.height * 0.024),
                  disabledBorderColor: Colors.white,
                  highlightedBorderColor: Colors.white,
                  splashColor: Colors.blueAccent,
                  highlightColor: Colors.blue,
                  color: Color.fromRGBO(66, 134, 244, 1),
                  child: Text(
                    "Hashtags to Target",
                    style: TextStyle(
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontSize: deviceSize.width * 0.051,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'AvenirNext'),
                  ),
                  onPressed: () {
                    HapticFeedback.vibrate();
                    /*Navigator.of(context, rootNavigator: false).push(
                      CupertinoPageRoute<bool>(
                        fullscreenDialog: false,
                        builder: (BuildContext context) => HashtagTargetPage(),
                      ),
                    );*/
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SupportPage extends StatefulWidget {
  SupportPage();
  @override
  _SupportPage createState() {
    return new _SupportPage();
  }
}

class _SupportPage extends State<SupportPage> with TickerProviderStateMixin {
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

  AnimationController _managerpage1controller;
  Animation<Offset> _managerpageoffsetFloat;

  @override
  void initState() {
    setState(() {});
    super.initState();
    _managerpage1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _managerpage1controller.forward();

    _managerpageoffsetFloat =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_managerpage1controller);
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [.33, .66, 1],
            colors: [
              Color.fromRGBO(30, 30, 30, 1),
              Color.fromRGBO(20, 20, 20, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
        ),
        child: SlideTransition(
            position: _managerpageoffsetFloat,
            child: Container(
                width: deviceSize.width,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: deviceSize.width * 0.88,
                      child: Container(
                          child: Text(
                        "Manager Page",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: deviceSize.height * 0.025,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'AvenirNext'),
                      )),
                    )))));
  }
}

class SettingsPage extends StatefulWidget {
  SettingsPage();
  @override
  _SettingsPage createState() {
    return new _SettingsPage();
  }
}

class _SettingsPage extends State<SettingsPage> with TickerProviderStateMixin {
  AnimationController _comingsoon1controller;
  Animation<Offset> _comingsoonoffsetFloat;
  AnimationController _settings1controller;
  AnimationController _settings2controller;
  AnimationController _settings3controller;
  AnimationController _settingsanimationController;
  TextEditingController emailCtrl;
  String userEmail;

  void _changeAccountPassword() async {
    FirebaseAuth.instance.currentUser().then((user) async {
      DocumentReference userReference =
          Firestore.instance.collection('cards').document(user.uid);
      DocumentSnapshot userRef = await userReference.get();
      setState(() {
        userEmail = userRef['Email'];
      });
    });
    FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail);
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'Password Reset Email Has Been Sent.',
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
                },
              ),
            ],
          );
        });
  }

  signout() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final useremail = user.email;
    print("Signed Out: $useremail");
    FirebaseAuth.instance.currentUser().then((user) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('IdToken', 'none');
      prefs.reload();
    });
    HapticFeedback.vibrate();
    Navigator.pushNamedAndRemoveUntil(
        context, '/start', ModalRoute.withName('/'));
  }

  void _onTapDown(TapDownDetails details) {
    HapticFeedback.lightImpact();
    _settingsanimationController.forward();
  }

  void _onTapUp() {
    _settingsanimationController.reverse();
  }

  void _onTapUp2(TapUpDetails details) {
    HapticFeedback.mediumImpact();
    _settingsanimationController.reverse();
    Future.delayed(const Duration(milliseconds: 1700), () async {
      setState(() async {
        signout();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _comingsoon1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _comingsoon1controller.forward();
    _settings1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _settings1controller.forward();

    _settings2controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _settings2controller.forward();

    _settings3controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _settings3controller.forward();

    _comingsoonoffsetFloat =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_comingsoon1controller);
    _settingsanimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0.0,
      upperBound: 0.09,
    );
    _settingsanimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _settingsanimationController.value;
    var deviceSize = MediaQuery.of(context).size;

    return Container(
        child: Center(
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [.33, .66, 1],
                    colors: [
                      Color.fromRGBO(30, 30, 30, 1),
                      Color.fromRGBO(20, 20, 20, 1),
                      Color.fromRGBO(0, 0, 0, 1),
                    ],
                  ),
                ),
                child: SlideTransition(
                    position: _comingsoonoffsetFloat,
                    child: Container(
                        width: deviceSize.width,
                        child: Align(
                            child: SizedBox(
                                width: deviceSize.width * 0.88,
                                child: ListView(children: <Widget>[
                                  ScaleTransition(
                                      scale: Tween(begin: .6, end: 1.0).animate(
                                          CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings1controller)),
                                      child: Text(
                                        "Settings",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            color: Colors.white,
                                            fontSize: deviceSize.width * 0.08,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'AvenirNext'),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                    top: deviceSize.width * 0.1,
                                  )),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  ScaleTransition(
                                      scale: Tween(begin: .5, end: 1.0).animate(
                                          CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings2controller)),
                                      child: Container(
                                          height: deviceSize.width * 0.12,
                                          child: ListTile(
                                            title: Text(
                                              "Update Account Password",
                                              style: TextStyle(
                                                  letterSpacing: 0.8,
                                                  color: Colors.white,
                                                  fontSize:
                                                      deviceSize.width * 0.045,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'AvenirNext'),
                                              textAlign: TextAlign.end,
                                            ),
                                            onTap: () {
                                              HapticFeedback.vibrate();
                                              _changeAccountPassword();
                                            },
                                          ))),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                    top: deviceSize.width * 0.1,
                                  )),
                                  ScaleTransition(
                                      scale: Tween(begin: .1, end: 1.0).animate(
                                          CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings3controller)),
                                      child: Container(
                                        child: Center(
                                          child: GestureDetector(
                                            onTapCancel: _onTapUp,
                                            onTapUp: _onTapUp2,
                                            onTapDown: _onTapDown,
                                            child: Transform.scale(
                                              scale: scale,
                                              child: Container(
                                                width: deviceSize.width * 0.75,
                                                height: deviceSize.width * 0.15,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          38.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0.0, 2.0),
                                                      blurRadius: 5.0,
                                                      spreadRadius: 0.25,
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  'Sign Out',
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      color: Colors.white,
                                                      fontSize:
                                                          deviceSize.height *
                                                              0.025,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'AvenirNext'),
                                                ),
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                ]))))))));
  }
}

class AboutPage extends StatefulWidget {
  AboutPage();
  @override
  _AboutPage createState() {
    return new _AboutPage();
  }
}

class _AboutPage extends State<AboutPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
        child: Center(
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [.33, .66, 1],
                    colors: [
                      Color.fromRGBO(30, 30, 30, 1),
                      Color.fromRGBO(20, 20, 20, 1),
                      Color.fromRGBO(0, 0, 0, 1),
                    ],
                  ),
                ),
                child: Container(
                    width: deviceSize.width,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: deviceSize.width * 0.88,
                          child: Container(
                              child: Text(
                            "About",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: deviceSize.height * 0.025,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AvenirNext'),
                          )),
                        ))))));
  }
}
