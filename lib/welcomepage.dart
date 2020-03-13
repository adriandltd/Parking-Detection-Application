import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyWelcomePage extends StatefulWidget {
  MyWelcomePage();
  @override
  _MyWelcomePage createState() {
    return new _MyWelcomePage();
  }
}

class _MyWelcomePage extends State<MyWelcomePage>
    with TickerProviderStateMixin {

  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 11.5;
    else if (deviceSize.height > 800)
      return 12.5;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 13.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 14.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 14.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 15.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  ScrollController _scrollController = ScrollController();
  pop() {
    Future.delayed(const Duration(milliseconds: 940), () {
      HapticFeedback.vibrate();
      return Navigator.pop(context);
    });
  }

  AnimationController _logoscalecontroller;
  AnimationController _scalecontroller1;
  AnimationController _scalecontroller2;
  AnimationController _scalecontroller3;
  AnimationController _scalecontroller4;
  AnimationController _scalecontroller5;
  AnimationController _scalecontroller6;
  AnimationController _scalecontroller7;
  AnimationController _scalecontroller8;
  AnimationController _scalecontroller9;
  AnimationController _scalecontroller10;
  AnimationController _scalecontroller11;
  AnimationController _scalecontroller12;
  AnimationController _scalecontroller13;
  @override
  void initState() {
    super.initState();
    _logoscalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 350));
    _logoscalecontroller.forward();

    _scalecontroller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _scalecontroller1.forward();

    _scalecontroller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _scalecontroller2.forward();

    _scalecontroller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _scalecontroller3.forward();

    _scalecontroller4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _scalecontroller4.forward();

    _scalecontroller5 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _scalecontroller5.forward();

    _scalecontroller6 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _scalecontroller6.forward();

    _scalecontroller7 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1400));
    _scalecontroller7.forward();

    _scalecontroller8 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1600));
    _scalecontroller8.forward();

    _scalecontroller9 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1800));
    _scalecontroller9.forward();

    _scalecontroller10 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1900));
    _scalecontroller10.forward();

    _scalecontroller11 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _scalecontroller11.forward();

    _scalecontroller12 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2100));
    _scalecontroller12.forward();

    _scalecontroller13 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2200));
    _scalecontroller13.forward();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 112, 0, 1),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.125, .25, .45, .5, .75, .875, 1],
                colors: [
                  Color.fromRGBO(255, 112, 0, 1),
                  Color.fromRGBO(255, 130, 0, 1),
                  Color.fromRGBO(255, 158, 0, 1),
                  Color.fromRGBO(255, 166, 0, 1),
                  Color.fromRGBO(255, 158, 0, 1),
                  Color.fromRGBO(255, 130, 0, 1),
                  Color.fromRGBO(255, 112, 0, 1),
                ],
              ),
            ),
            height: deviceSize.height * 2.65,
            width: deviceSize.width,
            alignment: Alignment.center,
            child: Container(
              width: deviceSize.width * 0.9,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: deviceSize.height * 0.0)),
                    ScaleTransition(
                      scale: Tween(begin: .75, end: 1.0).animate(
                          CurvedAnimation(
                              curve: Curves.decelerate,
                              parent: _logoscalecontroller)),
                      child: Image.asset('assets/findmeparkingiconblack.png',
                          scale: determineScaleFactor(),
                          alignment: Alignment.center),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.08)),
                    ScaleTransition(
                      scale: Tween(begin: .6, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate, parent: _scalecontroller1)),
                      child: Text(
                        "The best way to find a spot in a lot with no room",
                        style: TextStyle(
                            letterSpacing: 2,
                            height: 1.05,
                            color: Colors.black87,
                            fontSize: deviceSize.width * 0.06,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'AvenirNext'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.015)),
                    ScaleTransition(
                      scale: Tween(begin: .5, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate, parent: _scalecontroller2)),
                      child: Text(
                        "Looking for parking? You're not the only one. With the help of your local campus parking department, we are able to help create a fast and efficient way to find, and provide, you the closest available spot to park so that you can reach your class on time.",
                        style: TextStyle(
                            letterSpacing: 1.5,
                            height: 1.15,
                            color: Colors.white,
                            fontSize: deviceSize.width * 0.04,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'AvenirNext'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.05)),
                    ScaleTransition(
                      scale: Tween(begin: .4, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate, parent: _scalecontroller3)),
                      child: Text(
                        " The reason behind parking manager",
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.black87,
                            fontSize: deviceSize.width * 0.06,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'AvenirNext'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.01)),
                    ScaleTransition(
                      scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate, parent: _scalecontroller4)),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "1. 27% student increase from 2000 to 2017\n2. Reduce emissions \n3. Improve class attendance\n4. Provide a fast and easy experience\n5. Create a safer environment",
                              style: TextStyle(
                                  height: 1.7,
                                  fontSize: deviceSize.width * 0.045,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'AvenirNext'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.025)),
                    ScaleTransition(
                        scale: Tween(begin: .2, end: 1.0).animate(
                            CurvedAnimation(
                                curve: Curves.decelerate,
                                parent: _scalecontroller5)),
                        alignment: Alignment.center),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.008)),
                    ScaleTransition(
                      scale: Tween(begin: .25, end: 1.0).animate(
                          CurvedAnimation(
                              curve: Curves.decelerate,
                              parent: _scalecontroller6)),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: deviceSize.height * 0.022,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: deviceSize.height * 0)),
                    ScaleTransition(
                      scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate, parent: _scalecontroller7)),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: deviceSize.width * 0.045,
                            color: Colors.black87,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Have our ",
                              style: TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'AvenirNext'),
                            ),
                            TextSpan(
                              text: "parking manager ",
                              style: TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'AvenirNext'),
                            ),
                            TextSpan(
                              text: "find a\n",
                              style: TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'AvenirNext'),
                            ),
                            TextSpan(
                              text: "space ",
                              style: TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'AvenirNext'),
                            ),
                            TextSpan(
                              text: "for you in seconds.",
                              style: TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'AvenirNext'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.05)),
                    ScaleTransition(
                      scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate, parent: _scalecontroller8)),
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: deviceSize.width / 100, //width of the border
                        ),
                        highlightElevation: 3,
                        disabledBorderColor: Colors.white,
                        highlightedBorderColor: Colors.white,
                        splashColor: Colors.green,
                        highlightColor: Colors.green,
                        color: Colors.green,
                        child: Text(
                          "\n\n\n\n\n\nConnection with database\nupdates and provides closest empty\nparking spot for your convenience\n\n\n\n\n\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 1.2,
                              height: 1.4,
                              color: Colors.white,
                              fontSize: deviceSize.width * 0.0325,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'AvenirNext'),
                        ),
                        onPressed: () {},
                        shape: CircleBorder(),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.04)),
                    ScaleTransition(
                      scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate,
                          parent: _scalecontroller9)),
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: deviceSize.width / 100, //width of the border
                        ),
                        highlightElevation: 3,
                        disabledBorderColor: Colors.white,
                        highlightedBorderColor: Colors.white,
                        splashColor: Colors.green,
                        highlightColor: Colors.green,
                        color: Colors.green,
                        child: Text(
                          "\n\n\n\n\n\nMinimalistic design prevents\nuser from interacting with device while\ndriving to provide a safe experience \nfor all\n\n\n\n\n\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 1.2,
                              height: 1.4,
                              color: Colors.white,
                              fontSize: deviceSize.width * 0.0325,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'AvenirNext'),
                        ),
                        onPressed: () {},
                        shape: CircleBorder(),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.04)),
                    ScaleTransition(
                      scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate,
                          parent: _scalecontroller10)),
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: deviceSize.width / 100, //width of the border
                        ),
                        highlightElevation: 3,
                        disabledBorderColor: Colors.white,
                        highlightedBorderColor: Colors.white,
                        splashColor: Colors.green,
                        highlightColor: Colors.green,
                        color: Colors.green,
                        child: Text(
                          "\n\n\n\n\n\nLogin with your student email\nor create an account and sign in\n with no fees\n\n\n\n\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 1.2,
                              height: 1.4,
                              color: Colors.white,
                              fontSize: deviceSize.width * 0.0355,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'AvenirNext'),
                        ),
                        onPressed: () {},
                        shape: CircleBorder(),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: deviceSize.height * 0.15)),
                    ScaleTransition(
                      scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate,
                          parent: _scalecontroller11)),
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: deviceSize.width / 250, //width of the border
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
                          "Tap to Start",
                          style: TextStyle(
                              letterSpacing: 3.5,
                              height: 1.5,
                              color: Colors.white,
                              fontSize: deviceSize.height * 0.017,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'AvenirNext'),
                        ),
                        onPressed: () {
                          HapticFeedback.vibrate();
                          _scrollController
                              .animateTo(
                                  _scrollController.position.minScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linearToEaseOut)
                              .then(pop());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(bottom: deviceSize.height * 0.08)),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
