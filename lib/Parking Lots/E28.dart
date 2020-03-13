import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:komi_social/Tools/connection.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zoom_widget/zoom_widget.dart';

class E28 extends StatefulWidget {
  E28();
  @override
  _E28 createState() {
    return _E28();
  }
}

class _E28 extends State<E28> with TickerProviderStateMixin {
  AnimationController _animationcontroller;
  Animation<Offset> _animationoffsetFloat;

  bool _hasNetworkConnection;
  bool _fallbackViewOn;

  @override
  void initState() {
    super.initState();
    super.initState();
    _hasNetworkConnection = false;
    _fallbackViewOn = false;
    _animationcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _animationcontroller.forward();

    _animationoffsetFloat =
        Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
            .animate(_animationcontroller);
  }

  determineScaleFactor() {
    var deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height > 900)
      return 0.05;
    else if (deviceSize.height > 800)
      return 0.1;
    else if (deviceSize.height > 700 && deviceSize.height < 800)
      return 0.2;
    else if (deviceSize.height > 600 && deviceSize.height < 700)
      return 0.3;
    else if (deviceSize.height > 500 && deviceSize.height < 600)
      return 0.4;
    else if (deviceSize.height > 400 && deviceSize.height < 500)
      return 0.5;
    else if (deviceSize.height > 300 && deviceSize.height < 400) return 4.5;
  }

  Stream<int> get stream async* {
    throw StateError('error');
  }

  void _updateConnectivity(dynamic hasConnection) {
    if (!_hasNetworkConnection) {
      if (!_fallbackViewOn) {
        setState(() {
          _fallbackViewOn = true;
          _hasNetworkConnection = hasConnection;
        });
      }
    } else {
      if (_fallbackViewOn) {
        setState(() {
          _fallbackViewOn = false;
          _hasNetworkConnection = hasConnection;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    connectionStatus.connectionChange.listen(_updateConnectivity);
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 112, 0, 1),
        primary: true,
        elevation: 0,
        title: Text(
          "Parking Lot E28",
          style: TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontSize: deviceSize.width * 0.06,
              fontWeight: FontWeight.w600,
              fontFamily: 'AvenirNext'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [.33, .66, 1],
                colors: [
                  Color.fromRGBO(255, 140, 0, 1),
                  Color.fromRGBO(255, 120, 0, 1),
                  Color.fromRGBO(255, 112, 0, 1),
                ],
              ),
            ),
            height: deviceSize.height,
            width: deviceSize.width,
            child: SlideTransition(
                position: _animationoffsetFloat,
                child: FutureBuilder(
                    future: connectionStatus.checkConnection(),
                    builder: (context, snapshot) {
                      if (!snapshot.data) {
                        return Container(
                          child: Center(
                            child: SizedBox(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                              width: 30,
                              height: 30,
                            ),
                          ),
                        );
                      }
                      return Zoom(
                          zoomSensibility: 1.5,
                          initZoom: 0,
                          canvasColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          width: 811,
                          height: 811,
                          child: Stack(children: <Widget>[
                            Center(
                              child: Image.asset('assets/parkinglots/E28.png',
                                  scale: determineScaleFactor(),
                                  alignment: Alignment.topCenter),
                            ),
                            Align(
                              alignment: Alignment(-0.75, 0.5),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-1']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, 0.425),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-2']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, 0.35),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-3']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, 0.275),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-4']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, 0.2),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-5']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, 0.125),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-6']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, 0.05),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-7']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.025),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-8']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.1),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-9']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.175),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-10']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.25),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-11']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.325),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-12']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.4),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-13']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.475),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-14']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.55),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-15']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.625),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-16']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.75, -0.7),
                              child: Container(
                                height: 25.0,
                                width: 70.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-17']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
//////////////////////////////////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.55, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-18']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.475, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-19']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.4, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-20']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.325, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-21']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.25, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-22']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.175, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-23']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.1, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-24']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.025, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-25']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.05, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-26']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.125, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-27']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.2, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-28']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.275, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-29']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.35, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-30']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.5, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-31']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          child: Image.asset(
                                              'assets/handicap-icon.png',
                                              scale: determineScaleFactor(),
                                              alignment: Alignment.center),
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.65, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-32']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          child: Image.asset(
                                              'assets/handicap-icon.png',
                                              scale: determineScaleFactor(),
                                              alignment: Alignment.center),
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.8, -0.94),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-33']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          child: Image.asset(
                                              'assets/handicap-icon.png',
                                              scale: determineScaleFactor(),
                                              alignment: Alignment.center),
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
////////////////////////////////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.46, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-34']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.385, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-35']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.31, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-36']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.235, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-37']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.16, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-38']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.085, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-39']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.01, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-40']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.065, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-41']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.14, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-42']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.215, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-43']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.29, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-44']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.365, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-45']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.44, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-46']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.515, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-47']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.59, -0.62),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-48']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
////////////////////////////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.46, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-49']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.385, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-50']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.31, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-51']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.235, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-52']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.16, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-53']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.085, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-54']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.01, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-55']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.065, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-56']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.14, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-57']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.215, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-58']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.29, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-59']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.365, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-60']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.44, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-61']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.515, -0.4),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-62']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
////////////////////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.46, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-63']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.385, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-64']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.31, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-65']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.235, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-66']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.16, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-67']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.085, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-68']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.01, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-69']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.065, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-70']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.14, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-71']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.215, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-72']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.29, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-73']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.365, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-74']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.44, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-75']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.515, -0.05),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-76']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
////////////////////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.46, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-77']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.385, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-78']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.31, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-79']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.235, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-80']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.16, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-81']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.085, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-82']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.01, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-83']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.065, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-84']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.14, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-85']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.215, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-86']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.29, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-87']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.365, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-88']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.44, 0.17),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-89']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
////////////////////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.46, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-90']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.385, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-91']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.31, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-92']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.235, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-93']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.16, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-94']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.085, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-95']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.01, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-96']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.065, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-97']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.14, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-98']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.215, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-99']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.29, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-100']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.365, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-101']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.44, 0.5),
                              child: Container(
                                height: 70.0,
                                width: 25.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('E28')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-102']['availability'])
                                          color = Colors.green;
                                        else
                                          color = Colors.red;
                                        return DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: color),
                                        );
                                      } else {
                                        return SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 25,
                                          height: 25,
                                        );
                                      }
                                    }),
                              ),
                            ),
                          ]));
                    })),
          )
        ],
      ),
    );
  }
}
