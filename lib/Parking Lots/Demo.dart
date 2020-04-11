import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:komi_social/Tools/connection.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Demo extends StatefulWidget {
  Demo();
  @override
  _Demo createState() {
    return _Demo();
  }
}

class _Demo extends State<Demo> with TickerProviderStateMixin {
  AnimationController _animationcontroller;
  Animation<Offset> _animationoffsetFloat;
  AnimationController _manualselection1controller;
  AnimationController _manualselection2controller;
  AnimationController _manualselection3controller;
  AnimationController _manualselection4controller;

  Animation<Offset> _manualselectionoffsetFloat;

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
            .animate(_animationcontroller);_manualselection1controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 385));
    _manualselection1controller.forward();

    _manualselection2controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _manualselection2controller.forward();
    _manualselection3controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _manualselection3controller.forward();

    _manualselection4controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _manualselection4controller.forward();

    _manualselectionoffsetFloat =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
            .animate(_manualselection1controller);

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
      body: Stack(
        children: <Widget>[
          Container(
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
            position: _manualselectionoffsetFloat,
            child: ScaleTransition(
              scale: Tween(begin: .3, end: 1.0).animate(CurvedAnimation(
                  curve: Curves.decelerate,
                  parent: _manualselection2controller)),
              child: ScaleTransition(
                  scale: Tween(begin: .75, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.elasticIn,
                      parent: _manualselection3controller)),
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
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.8, -0.9),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-1']
                                            ['availability'])
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
                              alignment: Alignment(-0.5, -0.9),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-2']
                                            ['availability'])
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
                              alignment: Alignment(-0.2, -0.9),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-3']
                                            ['availability'])
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
                              alignment: Alignment(0.1, -0.9),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-4']
                                            ['availability'])
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
                              alignment: Alignment(0.4, -0.9),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-5']
                                            ['availability'])
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
                              alignment: Alignment(0.7, -0.9),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-6']
                                            ['availability'])
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
                            ////////////////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.8, -0.45),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-7']
                                            ['availability'])
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
                              alignment: Alignment(-0.5, -0.45),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-8']
                                            ['availability'])
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
                              alignment: Alignment(-0.2, -0.45),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-9']
                                            ['availability'])
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
                              alignment: Alignment(0.1, -0.45),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-10']
                                            ['availability'])
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
                              alignment: Alignment(0.4, -0.45),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-11']
                                            ['availability'])
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
                              alignment: Alignment(0.7, -0.45),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-12']
                                            ['availability'])
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
                            /////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.8, 0.4),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-13']
                                            ['availability'])
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
                              alignment: Alignment(-0.5, 0.4),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-14']
                                            ['availability'])
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
                              alignment: Alignment(-0.2, 0.4),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-15']
                                            ['availability'])
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
                              alignment: Alignment(0.1, 0.4),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-16']
                                            ['availability'])
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
                              alignment: Alignment(0.4, 0.4),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-17']
                                            ['availability'])
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
                              alignment: Alignment(0.7, 0.4),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-18']
                                            ['availability'])
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
                            //////////////////////////////////////////////////
                            Align(
                              alignment: Alignment(-0.8, 0.85),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-19']
                                            ['availability'])
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
                              alignment: Alignment(-0.5, 0.85),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-20']
                                            ['availability'])
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
                              alignment: Alignment(-0.2, 0.85),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-21']
                                            ['availability'])
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
                              alignment: Alignment(0.1, 0.85),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-22']
                                            ['availability'])
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
                              alignment: Alignment(0.4, 0.85),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-23']
                                            ['availability'])
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
                              alignment: Alignment(0.7, 0.85),
                              child: Container(
                                height: 130.0,
                                width: 85.0,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Parking Lots')
                                        .document('Demo')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      Color color;
                                      if (snapshot.hasData &&
                                          !snapshot.hasError) {
                                        if (snapshot.data['spot-24']
                                            ['availability'])
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
            ))],
      ),
    );
  }
}
