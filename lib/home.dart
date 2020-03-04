import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:fl_chart/fl_chart.dart';
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
  String instaUsername;
  String userEmail;
  String name;
  String currentUserPlan;
  String profilerating;

  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 10.5;
    else if (deviceSize.height > 800)
      return 11.5;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 12.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 13.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 13.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 14.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
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

  Future<void> getUserInfo() async {
    FirebaseAuth.instance.currentUser().then((user) async {
      DocumentReference userReference =
          Firestore.instance.collection('cards').document(user.uid);
      DocumentSnapshot userRef = await userReference.get();
      setState(() {
        var token;
        userEmail = userRef['Email'];
        instaUsername = userRef['Insta-User'];
        name = userRef['Name'];
        profilerating = userRef['Profile Rating'];
        FirebaseAuth.instance.currentUser().then((user) {
          token = user.getIdToken();
          final FirebaseAuth _auth = FirebaseAuth.instance;
          _auth.signInWithCustomToken(token: token);
        });
      });
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      setState(() async {
        getUserInfo();
      });
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
          body = _weeklyreports(deviceSize);
        });
        break;
      case 1:
        setState(() {
          body = _audiencetargeting(deviceSize);
        });
        break;
      case 2:
        setState(() {
          body = _contentschedule(deviceSize);
        });
        break;
      case 3:
        setState(() {
          body = _contactmanager(deviceSize);
        });
        break;
      case 4:
        setState(() {
          body = _settings(deviceSize);
        });
        break;
      case 5:
        setState(() {
          body = _about(deviceSize);
        });
        break;
      default:
        setState(() {
          body = _weeklyreports(deviceSize);
        });
    }
  }

  Widget _weeklyreports(deviceSize) {
    getUserInfo();
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(66, 134, 244, 1),
          primary: true,
          elevation: 0,
          title: Image.asset(
            'assets/komi social white.png',
            scale: determineScaleFactor(),
          )),
      drawer: _drawer(deviceSize),
      body: WeeklyPage(profilerating),
    );
  }

  Widget _audiencetargeting(deviceSize) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(66, 134, 244, 1),
        primary: true,
        elevation: 0,
        title: Image.asset(
          'assets/komi social white.png',
          scale: determineScaleFactor(),
        ),
      ),
      drawer: _drawer(deviceSize),
      body: AudiencePage(),
    );
  }

  Widget _contentschedule(deviceSize) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(66, 134, 244, 1),
        primary: true,
        elevation: 0,
        title: Image.asset(
          'assets/komi social white.png',
          scale: determineScaleFactor(),
        ),
      ),
      drawer: _drawer(deviceSize),
      backgroundColor: Color.fromRGBO(66, 134, 244, 1),
      body: ContentPage(),
    );
  }

  Widget _contactmanager(deviceSize) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(66, 134, 244, 1),
          primary: true,
          elevation: 0,
          title: Image.asset(
            'assets/komi social white.png',
            scale: determineScaleFactor(),
          ),
        ),
        drawer: _drawer(deviceSize),
        body: ManagerPage());
  }

  Widget _settings(deviceSize) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(66, 134, 244, 1),
        primary: true,
        elevation: 0,
        title: Image.asset(
          'assets/komi social white.png',
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
        backgroundColor: Color.fromRGBO(66, 134, 244, 1),
        primary: true,
        elevation: 0,
        title: Image.asset(
          'assets/komi social white.png',
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
          gradient: RadialGradient(
            radius: 1.6,
            center: Alignment.center,
            stops: [.33, .66, .99],
            colors: [
              // Color.fromRGBO(255, 212, 109, 1),
              // Color.fromRGBO(255, 200, 70, 1),
              Color.fromRGBO(76, 158, 244, 1),
              Color.fromRGBO(68, 140, 244, 1),
              Color.fromRGBO(62, 130, 244, 1),
            ],
          ),
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: deviceSize.width * 0.1)),
            StreamBuilder(
                stream: Firestore.instance.collection('cards').snapshots(),
                builder: (context, snapshop) {
                  if (instaUsername == null || profilerating == null)
                    return FadeTransition(
                      opacity: Tween(begin: .5, end: 1.0).animate(
                          CurvedAnimation(
                              curve: Curves.elasticInOut,
                              parent: _sidebarcontroller)),
                      child: Container(
                        width: deviceSize.width * 0.23,
                        height: deviceSize.width * 0.23,
                        child: Center(
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: const CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )),
                        ),
                      ),
                    );
                  return ScaleTransition(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset('assets/komi logo april 2019.png',
                                    scale: determineScaleFactor2(),
                                    alignment: Alignment.center),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset('assets/komi social white.png',
                                    scale: determineScaleFactor3(),
                                    alignment: Alignment.center),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: deviceSize.width * 0.055)),
                        Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: deviceSize.width * 0.055)),
                            Text(
                              '<@$instaUsername>',
                              style: TextStyle(
                                  height: 0.8,
                                  color: Colors.white,
                                  fontSize: deviceSize.width * 0.038,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'AvenirNext'),
                            ),
                            Text(
                              '<$profilerating>',
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  height: 1.5,
                                  color: Colors.white,
                                  fontSize: deviceSize.width * 0.09,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'AvenirNext'),
                            ),
                            Text(
                              'Profile Rating',
                              style: TextStyle(
                                  letterSpacing: 1.25,
                                  height: 1,
                                  color: Colors.white,
                                  fontSize: deviceSize.width * 0.037,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'AvenirNext'),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: deviceSize.width * 0.055)),
                          ],
                        )
                      ],
                    ),
                    scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.bounceOut, parent: _sidebarcontroller)),
                  );
                }),
            Divider(
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.grey[200],
              ),
              title: Text(
                'Weekly Reports',
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
                Icons.people,
                color: Colors.grey[200],
              ),
              title: Text(
                'Audience Targeting',
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
            ListTile(
              leading: Icon(
                Icons.schedule,
                color: Colors.grey[200],
              ),
              title: Text(
                'Content Scheduling & Posting',
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
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey[200],
              ),
              title: Text(
                'Contact Your Manager',
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
                  page = 4;
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
                  page = 5;
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

class WeeklyPage extends StatefulWidget {
  final String rating;
  WeeklyPage(this.rating);
  @override
  _WeeklyPage createState() {
    return new _WeeklyPage(this.rating);
  }
}

class _WeeklyPage extends State<WeeklyPage> with TickerProviderStateMixin {
  String profilerating;
  String currentUserPlan;
  String engagerating;
  String topsource1;
  String topsource2;
  String topsource3;
  int followersgained;
  var followerschartdata;
  var followerschartmonths;
  AnimationController _weekly1controller;
  AnimationController _weekly2controller;
  AnimationController _weekly3controller;
  AnimationController _weekly4controller;
  AnimationController _weekly5controller;
  AnimationController _weekly6controller;
  AnimationController _weekly7controller;
  AnimationController _weekly8controller;
  AnimationController _weekly9controller;
  AnimationController _weekly10controller;
  AnimationController _weekly11controller;
  AnimationController _weekly12controller;
  AnimationController _weekly13controller;
  AnimationController _weekly14controller;
  AnimationController _weekly15controller;
  AnimationController _weekly16controller;

  Animation<Offset> _weeklyoffsetFloat;
  AnimationController _sidebarcontroller;

  _WeeklyPage(this.profilerating);
  @override
  void initState() {
    setState(() {
      getUserInfo();
      //getUserInfo2();
      checkmonth();
    });
    super.initState();
    _sidebarcontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _sidebarcontroller.forward();
    _weekly1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _weekly1controller.forward();

    _weekly2controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _weekly2controller.forward();

    _weekly3controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _weekly3controller.forward();

    _weekly4controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _weekly4controller.forward();

    _weekly5controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _weekly5controller.forward();

    _weekly6controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    _weekly6controller.forward();

    _weekly7controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _weekly7controller.forward();

    _weekly8controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _weekly8controller.forward();

    _weekly9controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _weekly9controller.forward();

    _weekly10controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 850));
    _weekly10controller.forward();

    _weekly11controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _weekly11controller.forward();

    _weekly12controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 950));
    _weekly12controller.forward();

    _weekly13controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _weekly13controller.forward();

    _weekly14controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1050));
    _weekly14controller.forward();

    _weekly15controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1100));
    _weekly15controller.forward();

    _weekly16controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1050));
    _weekly16controller.forward();

    _weeklyoffsetFloat =
        Tween<Offset>(begin: Offset(-0.5, 0.0), end: Offset.zero)
            .animate(_weekly1controller);
  }

  Future<void> getUserInfo() async {
    Future.delayed(const Duration(milliseconds: 0), () async {
      FirebaseAuth.instance.currentUser().then((user) async {
        DocumentReference userReference =
            Firestore.instance.collection('cards').document(user.uid);
        DocumentSnapshot userRef = await userReference.get();
        setState(() {
          var token;
          currentUserPlan = userRef['Plan'];
          Future.delayed(const Duration(milliseconds: 100), () async {
            followersgained = userRef['Followers Gained'];
          });
          Future.delayed(const Duration(milliseconds: 300), () async {
            engagerating = userRef['Engagement Rate'];
          });
          Future.delayed(const Duration(milliseconds: 500), () async {
            profilerating = userRef['Profile Rating'];
          });
          Future.delayed(const Duration(milliseconds: 700), () async {
            topsource1 = userRef['Top Source 01'];
          });
          Future.delayed(const Duration(milliseconds: 700), () async {
            topsource2 = userRef['Top Source 02'];
          });
          Future.delayed(const Duration(milliseconds: 700), () async {
            topsource3 = userRef['Top Source 03'];
          });
          FirebaseAuth.instance.currentUser().then((user) {
            token = user.getIdToken();
            final FirebaseAuth _auth = FirebaseAuth.instance;
            _auth.signInWithCustomToken(token: token);
          });
        });
      });
    });
  }

  Future<void> checkmonth() async {
    var currentmonth = DateTime.now().month;
    if (currentmonth != followerschartmonths[0]) {
      var followersgaineddata = [
        followersgained,
        followerschartdata[0],
        followerschartdata[1],
        followerschartdata[2]
      ];
      var followersgainedmonths;
      if (DateTime.now().month == 1) {
        followersgainedmonths = [DateTime.now().month, 12, 11, 10];
      } else if (DateTime.now().month == 2) {
        followersgainedmonths = [DateTime.now().month, 1, 12, 11];
      } else if (DateTime.now().month == 3) {
        followersgainedmonths = [DateTime.now().month, 2, 1, 12];
      } else {
        followersgainedmonths = [
          DateTime.now().month,
          DateTime.now().month - 1,
          DateTime.now().month - 2,
          DateTime.now().month - 3
        ];
      }
      FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance
            .collection('cards')
            .document(user.uid)
            .collection('chartdata')
            .document(user.uid)
            .setData({
          'Followers Gained Data': followersgaineddata,
          'Followers Gained Months': followersgainedmonths,
        }, merge: true);
      });
    } else {
      var followersgaineddata = [
        followersgained,
        followerschartdata[1],
        followerschartdata[2],
        followerschartdata[3]
      ];
      FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance
            .collection('cards')
            .document(user.uid)
            .collection('chartdata')
            .document(user.uid)
            .setData({
          'Followers Gained Data': followersgaineddata,
        }, merge: true);
      });
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {
      getUserInfo();
      //getUserInfo2();
      checkmonth();
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            center: Alignment.bottomCenter,
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
        child: SlideTransition(
          position: _weeklyoffsetFloat,
          child: ScaleTransition(
            scale: Tween(begin: .75, end: 1.0).animate(CurvedAnimation(
                curve: Curves.decelerate, parent: _weekly1controller)),
            child: SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView(
                children: <Widget>[
                  ScaleTransition(
                    scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly2controller)),
                    child: Text(
                      "Weekly Reports",
                      style: TextStyle(
                          height: 1.1,
                          color: Colors.white,
                          fontSize: deviceSize.width * 0.095,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'AvenirNext'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ScaleTransition(
                    scale: Tween(begin: .65, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly3controller)),
                    child: Divider(
                      height: 5,
                      indent: 65,
                      endIndent: 65,
                      color: Colors.grey[300],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.03,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .6, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly4controller)),
                    child: Text(
                      "Followers Gained",
                      style: TextStyle(
                          height: 1.2,
                          color: Colors.white,
                          fontSize: deviceSize.width * 0.065,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'AvenirNext'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.005,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .55, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly5controller)),
                    child: StreamBuilder(
                      stream:
                          Firestore.instance.collection('cards').snapshots(),
                      builder: (context, snapshop) {
                        if (followersgained == null)
                          return FadeTransition(
                            opacity: Tween(begin: .5, end: 1.0).animate(
                                CurvedAnimation(
                                    curve: Curves.elasticInOut,
                                    parent: _sidebarcontroller)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                child: Container(
                                  child: Center(
                                    child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 3,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        if (followersgained <= 0)
                          return Text(
                            '<$followersgained>',
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.white,
                                fontSize: deviceSize.width * 0.065,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'AvenirNext'),
                            textAlign: TextAlign.center,
                          );
                        else
                          return Text(
                            '<+$followersgained>',
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.white,
                                fontSize: deviceSize.width * 0.065,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'AvenirNext'),
                            textAlign: TextAlign.center,
                          );
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.025,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .45, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly7controller)),
                    child: Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Colors.grey[300],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.025,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .4, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly8controller)),
                    child: Text(
                      "Engagement Rate",
                      style: TextStyle(
                          height: 1.2,
                          color: Colors.white,
                          fontSize: deviceSize.width * 0.065,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'AvenirNext'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.005,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .35, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly9controller)),
                    child: StreamBuilder(
                      stream:
                          Firestore.instance.collection('cards').snapshots(),
                      builder: (context, snapshop) {
                        if (engagerating == null)
                          return FadeTransition(
                            opacity: Tween(begin: .5, end: 1.0).animate(
                                CurvedAnimation(
                                    curve: Curves.elasticInOut,
                                    parent: _sidebarcontroller)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                child: Container(
                                  child: Center(
                                    child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 3,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        if (engagerating.length > 10)
                          return Text(
                            '<$engagerating>',
                            style: TextStyle(
                                height: 2,
                                color: Colors.white,
                                fontSize: deviceSize.width * 0.05,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'AvenirNext'),
                            textAlign: TextAlign.center,
                          );
                        else
                          return Text(
                            '<$engagerating%>',
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.white,
                                fontSize: deviceSize.width * 0.065,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'AvenirNext'),
                            textAlign: TextAlign.center,
                          );
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.01,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly10controller)),
                    child: Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Colors.grey[300],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.025,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .25, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly11controller)),
                    child: Text(
                      "Profile Rating",
                      style: TextStyle(
                          height: 1.2,
                          color: Colors.white,
                          fontSize: deviceSize.width * 0.065,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'AvenirNext'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.005,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .2, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly12controller)),
                    child: StreamBuilder(
                      stream:
                          Firestore.instance.collection('cards').snapshots(),
                      builder: (context, snapshop) {
                        if (profilerating == null)
                          return FadeTransition(
                            opacity: Tween(begin: .5, end: 1.0).animate(
                                CurvedAnimation(
                                    curve: Curves.elasticInOut,
                                    parent: _sidebarcontroller)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                child: Container(
                                  child: Center(
                                    child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 3,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        return Text(
                          '<$profilerating>',
                          style: TextStyle(
                              height: 1.2,
                              color: Colors.white,
                              fontSize: deviceSize.width * 0.065,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'AvenirNext'),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.01,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .15, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly13controller)),
                    child: Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Colors.grey[300],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.025,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly14controller)),
                    child: Text(
                      "Top Sources",
                      style: TextStyle(
                          height: 1.2,
                          color: Colors.white,
                          fontSize: deviceSize.width * 0.065,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'AvenirNext'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.01,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly14controller)),
                    child: StreamBuilder(
                      stream:
                          Firestore.instance.collection('cards').snapshots(),
                      builder: (context, snapshop) {
                        if (topsource1 == null &&
                            topsource2 == null &&
                            topsource3 == null)
                          return FadeTransition(
                            opacity: Tween(begin: .5, end: 1.0).animate(
                                CurvedAnimation(
                                    curve: Curves.elasticInOut,
                                    parent: _sidebarcontroller)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                child: Container(
                                  child: Center(
                                    child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 3,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        return Column(
                          children: <Widget>[
                            Text(
                              topsource1 == 'Unavailable'
                                  ? '<$topsource1>'
                                  : '<@$topsource1>',
                              style: TextStyle(
                                  height: 1.2,
                                  color: Colors.white,
                                  fontSize: deviceSize.width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'AvenirNext'),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                              top: deviceSize.height * 0.005,
                            )),
                            Text(
                              topsource2 == 'Unavailable'
                                  ? '<$topsource2>'
                                  : '<@$topsource2>',
                              style: TextStyle(
                                  height: 1.2,
                                  color: Colors.white,
                                  fontSize: deviceSize.width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'AvenirNext'),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                              top: deviceSize.height * 0.005,
                            )),
                            Text(
                              topsource3 == 'Unavailable'
                                  ? '<$topsource3>'
                                  : '<@$topsource3>',
                              style: TextStyle(
                                  height: 1.2,
                                  color: Colors.white,
                                  fontSize: deviceSize.width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'AvenirNext'),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    top: deviceSize.height * 0.03,
                  )),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _weekly15controller)),
                    child: Divider(
                      height: 15,
                      indent: 25,
                      endIndent: 25,
                      color: Colors.grey[300],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class AudiencePage extends StatefulWidget {
  AudiencePage();
  @override
  _AudiencePage createState() {
    return new _AudiencePage();
  }
}

class _AudiencePage extends State<AudiencePage> with TickerProviderStateMixin {
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
        gradient: RadialGradient(
          radius: 1.5,
          center: Alignment.bottomCenter,
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

class ContentPage extends StatefulWidget {
  ContentPage();
  @override
  _ContentPage createState() {
    return new _ContentPage();
  }
}

class _ContentPage extends State<ContentPage> with TickerProviderStateMixin {
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

  AnimationController _comingsoon1controller;
  AnimationController _comingsoon2controller;
  AnimationController _comingsoon3controller;
  AnimationController _comingsoon4controller;
  AnimationController _comingsoon5controller;
  AnimationController _comingsoon6controller;
  AnimationController _comingsoon7controller;
  Animation<Offset> _comingsoonoffsetFloat;

  AnimationController _settingsanimationController;

  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  bool signedup;

  submitinfoFirebase() async {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance.collection('cards').document(user.uid).setData({
        'Signed Up For Content': true,
      }, merge: true);
    });
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'You will be notified when our Content Scheduling feature is released.',
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
                  getUserInfo();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  submitinfoFirebase2() async {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance.collection('cards').document(user.uid).setData({
        'Signed Up For Content': false,
      }, merge: true);
    });
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'You will NOT be notified when our Content Scheduling feature is released.',
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
                  getUserInfo();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> getUserInfo() async {
    Future.delayed(const Duration(milliseconds: 0), () async {
      FirebaseAuth.instance.currentUser().then((user) async {
        DocumentReference userReference = Firestore.instance
            .collection('cards')
            .document(user.uid);
        DocumentSnapshot userRef = await userReference.get();
        Future.delayed(const Duration(milliseconds: 300), () async {
          setState(() {
            signedup = userRef['Signed Up For Content'];
          });
        });
      });
    });
  }

  @override
  void initState() {
    setState(() {
      getUserInfo();
    });
    super.initState();

    _comingsoon1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _comingsoon1controller.forward();

    _comingsoonoffsetFloat =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_comingsoon1controller);

    //Coming Soon Animation Controllers

    _comingsoon1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _comingsoon1controller.forward();

    _comingsoonoffsetFloat =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_comingsoon1controller);

    _comingsoon1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _comingsoon1controller.forward();

    _comingsoon2controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _comingsoon2controller.forward();

    _comingsoon4controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 550));
    _comingsoon4controller.forward();

    _comingsoon5controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    _comingsoon5controller.forward();

    _comingsoon6controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _comingsoon6controller.forward();

    _comingsoon3controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _comingsoon3controller.forward();

    _comingsoon7controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1450));
    _comingsoon7controller.forward();
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
        submitinfoFirebase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _settingsanimationController.value;
    var deviceSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            center: Alignment.bottomCenter,
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
        child: SlideTransition(
            position: _comingsoonoffsetFloat,
            child: ScaleTransition(
                scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                    curve: Curves.decelerate, parent: _comingsoon1controller)),
                child: Center(
                  child: Container(
                    width: deviceSize.width * 0.9,
                    child: ListView(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ScaleTransition(
                              scale: Tween(begin: .65, end: 1.0).animate(
                                  CurvedAnimation(
                                      curve: Curves.decelerate,
                                      parent: _comingsoon2controller)),
                              child: Text(
                                "Are you interested in having your manager schedule & post your content?",
                                style: TextStyle(
                                    height: 1.35,
                                    color: Colors.white,
                                    fontSize: deviceSize.width * 0.065,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'AvenirNext'),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                          top: deviceSize.height * 0.075,
                        )),
                        ScaleTransition(
                          scale: Tween(begin: .65, end: 1.0).animate(
                              CurvedAnimation(
                                  curve: Curves.decelerate,
                                  parent: _comingsoon3controller)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: deviceSize.width * 0.9,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white,
                                          width: deviceSize.width / 175),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                      top: deviceSize.height * 0.01,
                                    )),
                                    ScaleTransition(
                                      scale: Tween(begin: .55, end: 1.0)
                                          .animate(CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _comingsoon4controller)),
                                      child: Image.asset(
                                          'assets/komi logo april 2019.png',
                                          scale: determineScaleFactor(),
                                          alignment: Alignment.bottomLeft),
                                    ),
                                    ScaleTransition(
                                      scale: Tween(begin: .5, end: 1.0).animate(
                                          CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _comingsoon5controller)),
                                      child: Text(
                                        "Up to 30 posts a month.",
                                        style: TextStyle(
                                            letterSpacing: 1.45,
                                            height: 1.5,
                                            fontWeight: FontWeight.w600,
                                            fontSize: deviceSize.width * 0.065,
                                            color: Colors.white,
                                            fontFamily: 'AvenirNext'),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      top: deviceSize.height * 0.025,
                                    )),
                                    ScaleTransition(
                                      scale: Tween(begin: .45, end: 1.0)
                                          .animate(CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _comingsoon6controller)),
                                      child: Text(
                                        "• Upload Your Content & Captions\n• Schedule Your Posts in Advance with Your Manager\n• Your Manager Will Post On Your Behalf",
                                        style: TextStyle(
                                            height: 2,
                                            fontSize: deviceSize.width * 0.032,
                                            color: Colors.white,
                                            fontFamily: 'AvenirNext'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      top: deviceSize.width * 0.15,
                                    )),
                                    ScaleTransition(
                                        scale: Tween(begin: .4, end: 1.0)
                                            .animate(CurvedAnimation(
                                                curve: Curves.bounceOut,
                                                parent:
                                                    _comingsoon7controller)),
                                        child: StreamBuilder<Object>(
                                          stream: null,
                                          builder: (context, snapshot) {
                                            if(signedup == null){
                                              return Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child: SizedBox(
                                                              width: 25,
                                                              height: 25,
                                                              child:
                                                                  const CircularProgressIndicator(
                                                                strokeWidth: 3,
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                            Color>(
                                                                        Colors
                                                                            .white),
                                                              )),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                            }else if (signedup == false)
                                            {
                                            return Container(
                                              child: Center(
                                                child: GestureDetector(
                                                  onTapCancel: _onTapUp,
                                                  onTapUp: _onTapUp2,
                                                  onTapDown: _onTapDown,
                                                  child: Transform.scale(
                                                    scale: scale,
                                                    child: Container(
                                                      width:
                                                          deviceSize.width * 0.75,
                                                      height:
                                                          deviceSize.width * 0.15,
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                38.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black26,
                                                            offset:
                                                                Offset(0.0, 2.0),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 0.25,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Text(
                                                        'Sign Me Up!',
                                                        style: TextStyle(
                                                            letterSpacing: 1,
                                                            color: Colors.white,
                                                            fontSize:
                                                                deviceSize.height *
                                                                    0.025,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'AvenirNext'),
                                                      ),
                                                      alignment: Alignment.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                            }
                                            else{
                                              return Container(
                                              child: Center(
                                                child:  Text(
                                                        '<Already Signed Up>',
                                                        style: TextStyle(
                                                            letterSpacing: 1,
                                                            color: Colors.white,
                                                            fontSize:
                                                                deviceSize.height *
                                                                    0.025,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'AvenirNext'),
                                                      ),
                                              ),
                                            );
                                            }
                                          }
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      top: deviceSize.width * 0.065,
                                    )),
                                  ])),
                              Padding(
                                  padding: EdgeInsets.only(
                                top: deviceSize.width * 0.055,
                              )),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                          top: deviceSize.width * 0.025,
                        )),
                      ],
                    ),
                  ),
                ))));
  }
}

class ManagerPage extends StatefulWidget {
  ManagerPage();
  @override
  _ManagerPage createState() {
    return new _ManagerPage();
  }
}

class _ManagerPage extends State<ManagerPage> with TickerProviderStateMixin {
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

  AnimationController _scalecontroller1;
  AnimationController _scalecontroller2;

  AnimationController _managerpage1controller;
  Animation<Offset> _managerpageoffsetFloat;

  String managername;
  String manageremail;
  Timestamp serverTS;
  final Timestamp currentTS = Timestamp.now();
  bool hasAppointmentlocal;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  var _phonecontroller = TextEditingController();
  Future<void> getUserInfo() async {
      FirebaseAuth.instance.currentUser().then((user) async {
        DocumentReference userReference =
            Firestore.instance.collection('cards').document(user.uid);
        DocumentSnapshot userRef = await userReference.get();
        setState(() {
          Future.delayed(const Duration(milliseconds: 300), () async {
            managername = userRef['Manager'];
          });
          Future.delayed(const Duration(milliseconds: 500), () async {
            manageremail = userRef['Manager Email'];
          });
          serverTS = userRef['AppointmentTimeStamp'];
        });
      });
      FirebaseAuth.instance.currentUser().then((user) async {
        DocumentReference userReference = Firestore.instance
            .collection('cards')
            .document(user.uid)
            .collection('managerappointmentdata')
            .document(user.uid);
        DocumentSnapshot userRef = await userReference.get();
        Future.delayed(const Duration(milliseconds: 300), () async {
          setState(() {
            hasAppointmentlocal = userRef['hasAppointment'];
          });
        });
      });
  }

  ampm() {
    if (_time.period == DayPeriod.am) {
      return 'am';
    } else if (_time.period == DayPeriod.pm) {
      return 'pm';
    }
  }

  minute() {
    if (_time.minute < 10) {
      return '0' + _time.minute.toString();
    } else {
      return _time.minute.toString();
    }
  }

  hour() {
    if (_time.hourOfPeriod == 0) {
      return '12';
    } else {
      return _time.hourOfPeriod.toString();
    }
  }

  submitinfoFirebase() async {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('cards')
          .document(user.uid)
          .collection('managerappointmentdata')
          .document(user.uid)
          .setData({
        'hasAppointment': true,
      }, merge: true);
      Firestore.instance
          .collection('cards')
          .document(user.uid)
          .collection('managercancellationdata')
          .document(user.uid)
          .setData({
        'cancellationRequest': false,
      }, merge: true);
      Firestore.instance.collection('cards').document(user.uid).setData({
        'AppointmentTimeZone': _date.timeZoneName.toString(),
        'AppointmentTime': hour() + ':' + (minute()) + ' ' + (ampm()),
        'AppointmentDate': _date.month.toString() +
            '/' +
            _date.day.toString() +
            '/' +
            _date.year.toString(),
        'AppointmentPhone': _phonecontroller.text,
        'AppointmentTimeStamp': DateTime.parse(_date.year.toString() +
            "-" +
            dateStamp(_date.month) +
            "-" +
            (dateStamp(_date.day) +
                " " +
                dateStamp(_time.hour) +
                ":" +
                dateStamp(_time.minute) +
                ":00"))
      }, merge: true).then((val) {
        print('Appointment Info saved');
      });
    });
  }

  dateStamp(int numb) {
    if (numb.toString().length > 1) {
      return numb.toString();
    } else {
      return '0' + numb.toString();
    }
  }

  @override
  void initState() {
    setState(() {
      getUserInfo();
    });
    super.initState();
    _managerpage1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _managerpage1controller.forward();

    _managerpageoffsetFloat =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_managerpage1controller);

    _scalecontroller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _scalecontroller1.forward();

    _scalecontroller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _scalecontroller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            center: Alignment.bottomCenter,
            stops: [.25, .45, .85, 1],
            colors: [
              Color.fromRGBO(84, 164, 244, 1),
              Color.fromRGBO(78, 158, 244, 1),
              Color.fromRGBO(68, 140, 244, 1),
              Color.fromRGBO(66, 134, 244, 1),
            ],
          ),
        ),
        child: SlideTransition(
          position: _managerpageoffsetFloat,
          child: StreamBuilder(
              stream:
                  Firestore.instance.collection('cards').document().snapshots(),
              builder: (context, snapshot) {
                getUserInfo();
                if (hasAppointmentlocal == null) {
                  return FadeTransition(
                    opacity: Tween(begin: .5, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.elasticInOut, parent: _scalecontroller2)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: Container(
                              child: Center(
                                child: SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                          top: deviceSize.width * 0.025,
                        )),
                      ],
                    ),
                  );
                } /*else if (hasAppointmentlocal == true &&
                    serverTS.toDate().isAfter(currentTS.toDate())) {
                  return CurentAppointmentPage();
                } else {
                  return AppointmentPage();
                }*/
              }),
        ));
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
  AnimationController _settings4controller;
  AnimationController _settings5controller;
  AnimationController _settings6controller;
  AnimationController _settings7controller;
  AnimationController _settings8controller;
  AnimationController _settings9controller;
  AnimationController _settingsanimationController;
  TextEditingController emailCtrl;
  TextEditingController newpassCtrl;
  TextEditingController newpassCtrl2;
  TextEditingController currentpassCtrl;
  TextEditingController instapassCtrl;
  String newinstapass;
  String userEmail;
  bool pauseRequested;

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

  _changeInstaPassword(context) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'Update your Manager with your new Instagram Account Password',
              style: TextStyle(
                  letterSpacing: 1.1,
                  height: 1.1,
                  fontSize: 22,
                  fontFamily: 'AvenirNext',
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            content: TextField(
              autofocus: true,
              onChanged: (String value) {
                setState(() {
                  newinstapass = value;
                });
              },
              cursorColor: Colors.blue,
              controller: instapassCtrl,
              decoration: InputDecoration(hintText: 'New Instagram Password'),
              obscureText: true,
            ),
            contentTextStyle: TextStyle(
                letterSpacing: 1.1,
                height: 1.1,
                fontSize: 22,
                fontFamily: 'AvenirNext',
                fontWeight: FontWeight.w400),
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
                  if (newinstapass != null && newinstapass.isNotEmpty) {
                    FirebaseAuth.instance.currentUser().then((user) async {
                      Firestore.instance
                          .collection('cards')
                          .document(user.uid)
                          .setData({
                        'Insta-Password': newinstapass,
                      }, merge: true);
                    });
                    return showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding:
                                EdgeInsets.only(top: 35, left: 10, right: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            title: const Text(
                              'Successfully Submitted.',
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
                                  Navigator.of(context).pop();
                                  setState(() {
                                    newinstapass = null;
                                  });
                                },
                              ),
                            ],
                          );
                        });
                  } else {
                    return showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding:
                                EdgeInsets.only(top: 35, left: 10, right: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            title: const Text(
                              'Invalid Input.',
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
                },
              ),
            ],
          );
        });
  }

  _requestManagerChange() async {
    Future.delayed(const Duration(seconds: 5), () async {
      List managernamesarray;
      List manageremailarray;
      DocumentReference userReference =
          Firestore.instance.collection('managerdata').document('managerdata');
      DocumentSnapshot userRef = await userReference.get();
      setState(() {
        managernamesarray = userRef['Manager Names'];
        manageremailarray = userRef['emails'];
      });
      Random rnd;
      int min = 0;
      int max = managernamesarray.length;
      rnd = new Random();
      int random = min + rnd.nextInt(max - min);
      print(managernamesarray[random]);
      FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance.collection('cards').document(user.uid).setData({
          'Manager': managernamesarray[random],
          'Manager Email': manageremailarray[random],
        }, merge: true);
      });
    });
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'Manager Change Request Has Been Sent.',
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

  _updatePaymentDialog() {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(top: 35, left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'Payment Method Updated.',
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

 

  _pauseSubscription() async {
    var deviceSize = MediaQuery.of(context).size;
    bool connectedToInternet;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        connectedToInternet = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      connectedToInternet = false;
    }
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
            titlePadding: EdgeInsets.only(top: 25, left: 5, right: 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'Are you sure you want to pause your current subscription to your Komi Social account?',
              style: TextStyle(
                  letterSpacing: 1.1,
                  height: 1.1,
                  fontSize: 22,
                  fontFamily: 'AvenirNext',
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    color: Colors.red,
                    child: Text('No',
                        style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: 14,
                            fontFamily: 'AvenirNext',
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    right: deviceSize.width * 0.07,
                  )),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    color: Colors.green,
                    child: Text('Yes',
                        style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: 14,
                            fontFamily: 'AvenirNext',
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      FirebaseAuth.instance.currentUser().then((user) {
                        Firestore.instance
                            .collection('cards')
                            .document(user.uid)
                            .collection('pausesubscription')
                            .document(user.uid)
                            .setData({
                          'pauseRequest': true,
                        }, merge: true);
                      });
                      Future.delayed(const Duration(milliseconds: 300),
                          () async {
                        getUserInfo();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    right: deviceSize.width * 0.12,
                  )),
                ],
              ),
            ],
          );
        },
      );
    }
  }

  _cancelpausesubscription() async {
    var deviceSize = MediaQuery.of(context).size;
    bool connectedToInternet;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        connectedToInternet = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      connectedToInternet = false;
    }
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
            titlePadding: EdgeInsets.only(top: 25, left: 5, right: 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text(
              'Are you sure you want to pause your current subscription to your Komi Social account?',
              style: TextStyle(
                  letterSpacing: 1.1,
                  height: 1.1,
                  fontSize: 22,
                  fontFamily: 'AvenirNext',
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    color: Colors.red,
                    child: Text('No',
                        style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: 14,
                            fontFamily: 'AvenirNext',
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    right: deviceSize.width * 0.07,
                  )),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    color: Colors.green,
                    child: Text('Yes',
                        style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: 14,
                            fontFamily: 'AvenirNext',
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      FirebaseAuth.instance.currentUser().then((user) {
                        Firestore.instance
                            .collection('cards')
                            .document(user.uid)
                            .collection('pausesubscription')
                            .document(user.uid)
                            .setData({
                          'pauseRequest': false,
                        }, merge: true);
                      });
                      Future.delayed(const Duration(milliseconds: 300),
                          () async {
                        getUserInfo();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                    right: deviceSize.width * 0.12,
                  )),
                ],
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> getUserInfo() async {
    Future.delayed(const Duration(milliseconds: 0), () async {
      FirebaseAuth.instance.currentUser().then((user) async {
        DocumentReference userReference = Firestore.instance
            .collection('cards')
            .document(user.uid)
            .collection('pausesubscription')
            .document(user.uid);
        DocumentSnapshot userRef = await userReference.get();
        Future.delayed(const Duration(milliseconds: 300), () async {
          setState(() {
            pauseRequested = userRef['pauseRequest'];
          });
        });
      });
    });
  }

  deletedialog() async {
    var deviceSize = MediaQuery.of(context).size;
    bool connectedToInternet;
    try {
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
              titlePadding: EdgeInsets.only(top: 25, left: 5, right: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: const Text(
                'Are you sure you want to cancel your current subscription and delete your Komi Social account?',
                style: TextStyle(
                    letterSpacing: 1.1,
                    height: 1.1,
                    fontSize: 22,
                    fontFamily: 'AvenirNext',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      color: Colors.red,
                      child: Text('No',
                          style: TextStyle(
                              letterSpacing: 1.1,
                              fontSize: 14,
                              fontFamily: 'AvenirNext',
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        Navigator.of(context).pop();
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      right: deviceSize.width * 0.07,
                    )),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      color: Colors.green,
                      child: Text('Yes',
                          style: TextStyle(
                              letterSpacing: 1.1,
                              fontSize: 14,
                              fontFamily: 'AvenirNext',
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        _cancelSubscription();
                        Navigator.of(context).pop();
                        Future.delayed(const Duration(seconds: 10), () async {
                          signout();
                        });
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
                                  'Thank you for being with Komi Social, we hope you back again.',
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
                        Future.delayed(const Duration(seconds: 20), () async {
                          FirebaseAuth.instance.currentUser().then((user) {
                            Firestore.instance
                                .collection('cards')
                                .document(user.uid)
                                .delete();
                            user.delete();
                          });
                        });
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      right: deviceSize.width * 0.12,
                    )),
                  ],
                ),
              ],
            );
          },
        );
      }
    });
  }

  _cancelSubscription() {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('cards')
          .document(user.uid)
          .collection('tokens')
          .document(user.uid)
          .delete();
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
    getUserInfo();
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

    _settings4controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 850));
    _settings4controller.forward();

    _settings5controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _settings5controller.forward();

    _settings6controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 950));
    _settings6controller.forward();

    _settings7controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _settings7controller.forward();

    _settings8controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1050));
    _settings8controller.forward();

    _settings9controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1100));
    _settings9controller.forward();

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
                  gradient: RadialGradient(
                    radius: 1.5,
                    center: Alignment.bottomCenter,
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
                                  ScaleTransition(
                                      scale: Tween(begin: .4, end: 1.0).animate(
                                          CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings3controller)),
                                      child: Container(
                                          height: deviceSize.width * 0.12,
                                          child: ListTile(
                                            title: Text(
                                              "Update Instagram Password",
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
                                              _changeInstaPassword(context);
                                            },
                                          ))),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  ScaleTransition(
                                      scale: Tween(begin: .3, end: 1.0).animate(
                                          CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings4controller)),
                                      child: Container(
                                          height: deviceSize.width * 0.12,
                                          child: ListTile(
                                            title: Text(
                                              "Request New Manager Change",
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
                                              _requestManagerChange();
                                            },
                                          ))),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  ScaleTransition(
                                      scale: Tween(begin: .2, end: 1.0).animate(
                                          CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings6controller)),
                                      child: Container(
                                          height: deviceSize.width * 0.12,
                                          child: ListTile(
                                            title: Text(
                                              "Update Payment Method",
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
                                            },
                                          ))),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  ScaleTransition(
                                      scale: Tween(begin: .25, end: 1.0)
                                          .animate(CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings8controller)),
                                      child: Container(
                                          height: deviceSize.width * 0.12,
                                          child: StreamBuilder<Object>(
                                              stream: Firestore.instance
                                                  .collection('cards')
                                                  .snapshots(),
                                              builder: (context, snapshop) {
                                                if (pauseRequested == null)
                                                  return Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                        left: deviceSize.width *
                                                            0.35,
                                                      )),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child: SizedBox(
                                                              width: 25,
                                                              height: 25,
                                                              child:
                                                                  const CircularProgressIndicator(
                                                                strokeWidth: 3,
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                            Color>(
                                                                        Colors
                                                                            .white),
                                                              )),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                else if (pauseRequested ==
                                                    false) {
                                                  return ListTile(
                                                    title: Text(
                                                      "Pause Subscription",
                                                      style: TextStyle(
                                                          letterSpacing: 0.8,
                                                          color: Colors.white,
                                                          fontSize:
                                                              deviceSize.width *
                                                                  0.045,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'AvenirNext'),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    onTap: () {
                                                      HapticFeedback.vibrate();
                                                      _pauseSubscription();
                                                    },
                                                  );
                                                } else {
                                                  return ListTile(
                                                    title: Text(
                                                      "Cancel Current Pause On Subscription",
                                                      style: TextStyle(
                                                          letterSpacing: 0.8,
                                                          color: Colors.white,
                                                          fontSize:
                                                              deviceSize.width *
                                                                  0.045,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'AvenirNext'),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    onTap: () {
                                                      HapticFeedback.vibrate();
                                                      _cancelpausesubscription();
                                                    },
                                                  );
                                                }
                                              }))),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  ScaleTransition(
                                      scale: Tween(begin: .25, end: 1.0)
                                          .animate(CurvedAnimation(
                                              curve: Curves.decelerate,
                                              parent: _settings8controller)),
                                      child: Container(
                                          height: deviceSize.width * 0.12,
                                          child: ListTile(
                                            title: Text(
                                              "Delete Account & Cancel Subscription",
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
                                              deletedialog();
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
                                              parent: _settings9controller)),
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
                  gradient: RadialGradient(
                    radius: 1.5,
                    center: Alignment.bottomCenter,
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
