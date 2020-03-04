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
      return 9.5;
    else if (deviceSize.height > 800)
      return 10.5;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 11.0;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 12.0;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 12.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 13.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  determineScaleFactor2() {
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

  determineScaleFactor3() {
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
      return 11.5;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 12.0;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 10.0;
  }

  determineScaleFactor4() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 1.1;
    else if (deviceSize.height > 800)
      return 1.2;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 1.5;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 1.8;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 2.4;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 2.8;
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
  AnimationController _komiscalecontroller;
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
        vsync: this, duration: Duration(milliseconds: 1300));
    _logoscalecontroller.forward();

    _komiscalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _komiscalecontroller.forward();

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
          height: deviceSize.width * 9.5,
          width: deviceSize.width,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.1)),
                  ScaleTransition(
                    scale: Tween(begin: .75, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.bounceOut, parent: _logoscalecontroller)),
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/komi logo april 2019.png',
                            scale: determineScaleFactor2(),
                            alignment: Alignment.center),
                        Padding(
                            padding:
                                EdgeInsets.only(left: deviceSize.width * 0.01)),
                      ],
                    ),
                  ),
                  ScaleTransition(
                    scale: Tween(begin: .7, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.bounceOut, parent: _komiscalecontroller)),
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/komi social white.png',
                            scale: determineScaleFactor(),
                            alignment: Alignment.bottomCenter),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.05)),
                  ScaleTransition(
                    scale: Tween(begin: .6, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller1)),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "A new way\nto work with\na marketing\nagency.",
                          style: TextStyle(
                              letterSpacing: 3,
                              height: 1.05,
                              color: Colors.white,
                              fontSize: deviceSize.width * 0.14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'AvenirNext'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.04)),
                  ScaleTransition(
                    scale: Tween(begin: .5, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller2)),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "There is an ever growing need to establish yourself on\nInstagram. KomiSocial simplifies the experience of\nGrowing & marketing your page with no contracts or\nHidden fees and for 5% the cost of other traditional \nCompetitors. Forget wasting your money on\nWorkshops, online courses, branding specialists,\nAnd traditional marketing agencies, KomiSocial is the \nWay to go!",
                          style: TextStyle(
                              letterSpacing: 1.2,
                              height: 1.15,
                              color: Colors.white,
                              fontSize: deviceSize.width * 0.032,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'AvenirNext'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.05)),
                  ScaleTransition(
                    scale: Tween(begin: .4, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller3)),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Other social media\nMarketing agencies & services",
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: deviceSize.width * 0.0525,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'AvenirNext'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.015)),
                  ScaleTransition(
                    scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller4)),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: deviceSize.width * 0.051,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "1. -17% Average Follower Growth\n2. Bots/Fake Followers\n3. Spam/Fake Activity\n4. No Web Platform (Email)\n5. No Analytics or Reports\n6. Setup Over Email\n7. Basic Strategies (No Real Growth)\n8. Up to ",
                                style: TextStyle(
                                    height: 1.7,
                                    color: Colors.white,
                                    fontSize: deviceSize.width * 0.051,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "\$500",
                                style: TextStyle(
                                    height: 1.7,
                                    color: Colors.white,
                                    fontSize: deviceSize.width * 0.051,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: " or more!!",
                                style: TextStyle(
                                    height: 1.7,
                                    color: Colors.white,
                                    fontSize: deviceSize.width * 0.051,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.075)),
                  ScaleTransition(
                      scale: Tween(begin: .2, end: 1.0).animate(CurvedAnimation(
                          curve: Curves.decelerate, parent: _scalecontroller5)),
                      child: Image.asset(
                        'assets/komi social white.png',
                        scale: determineScaleFactor3(),
                      ),
                      alignment: Alignment.center),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.008)),
                  ScaleTransition(
                    scale: Tween(begin: .25, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller6)),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: deviceSize.height * 0.022,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "1. +85% Average Follower Growth\n2. Real, Organic Followers\n3. Organic Likes & Comments\n4. Real Time & Weekly Analytics\n5. Advanced niche Audience Growth\n6. Target Optimization\n7. Content Scheduling & Posting\n8. Sponsorship Search\n9. Starting at just ",
                                style: TextStyle(
                                    height: 1.65,
                                    color: Colors.white,
                                    fontSize: deviceSize.width * 0.051,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "\$3.30 ",
                                style: TextStyle(
                                    height: 1.65,
                                    color: Colors.white,
                                    fontSize: deviceSize.width * 0.051,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "a day",
                                style: TextStyle(
                                    height: 1.65,
                                    color: Colors.white,
                                    fontSize: deviceSize.width * 0.051,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.07)),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller7)),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: deviceSize.width * 0.045,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Have an ",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "account manager ",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "grow your\n",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "Instagram audience ",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'AvenirNext'),
                              ),
                              TextSpan(
                                text: "in minutes.",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'AvenirNext'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.05)),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller8)),
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/manager-avatar.png',
                            scale: 4.5, alignment: Alignment.center),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.045)),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller9)),
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
                        "\n\n\n\n\n\nPerform Actions & engagement to\noutreach potential followers.\nLike, comment, follow, unfollow\n\n\n\n\n\n",
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
                      padding: EdgeInsets.only(top: deviceSize.height * 0.04)),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller10)),
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
                        "\n\n\n\n\n\nTarget hashtags in your\n niche, usernames who follow your\ncompetitors & locations\nthat match your target audience\n\n\n\n\n\n",
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
                      padding: EdgeInsets.only(top: deviceSize.height * 0.04)),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller11)),
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
                        "\n\n\n\n\n\nWe keep your home feed clean\nso that you only see content\nfrom users you follown\n\n\n\n\n",
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
                      padding: EdgeInsets.only(top: deviceSize.height * 0.04)),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller12)),
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
                        "\n\n\n\n\n\nSchedule & post your content\non your behalf\n\n\n\n\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 1.2,
                            height: 1.4,
                            color: Colors.white,
                            fontSize: deviceSize.width * 0.037,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'AvenirNext'),
                      ),
                      onPressed: () {},
                      shape: CircleBorder(),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.2)),
                  ScaleTransition(
                    scale: Tween(begin: .1, end: 1.0).animate(CurvedAnimation(
                        curve: Curves.decelerate, parent: _scalecontroller13)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
