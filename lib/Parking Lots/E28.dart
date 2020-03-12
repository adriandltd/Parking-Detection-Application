import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
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
                child: Zoom(
                  zoomSensibility: 1.5,
                  initZoom: 0,
                  canvasColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  width: 811,
                  height: 811,
                  child: Stack(children: <Widget>[
                    Center(
                      child: Image.asset('assets/E28.png',
                          scale: determineScaleFactor(),
                          alignment: Alignment.topCenter),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0.5),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0.425),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0.35),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0.275),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0.2),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0.125),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0.05),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.025),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.1),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.175),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.25),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.325),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.4),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.475),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.55),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.625),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, -0.7),
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
//////////////////////////////////////////////////////////////////////////////
                    Align(
                      alignment: Alignment(-0.55, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.475, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.475, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.4, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.325, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.25, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.175, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.1, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.025, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.05, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.125, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.2, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.275, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.35, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.5, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          child: Image.asset('assets/handicap-icon.png',
                              scale: determineScaleFactor(),
                              alignment: Alignment.center),
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.65, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          child: Image.asset('assets/handicap-icon.png',
                              scale: determineScaleFactor(),
                              alignment: Alignment.center),
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.8, -0.94),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          child: Image.asset('assets/handicap-icon.png',
                              scale: determineScaleFactor(),
                              alignment: Alignment.center),
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
////////////////////////////////////////////////////////////////////////////
                    Align(
                      alignment: Alignment(-0.46, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.385, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.31, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.235, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.16, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.085, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.01, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.065, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.14, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.215, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.29, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.365, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.44, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.515, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.59, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.665, -0.62),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
////////////////////////////////////////////////////////////////////////
                    Align(
                      alignment: Alignment(-0.46, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.385, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.31, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.235, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.16, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.085, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.01, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.065, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.14, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.215, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.29, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.365, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.44, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.515, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.59, -0.4),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
////////////////////////////////////////////////////////////////
                  Align(
                      alignment: Alignment(-0.46, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.385, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.31, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.235, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.16, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.085, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.01, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.065, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.14, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.215, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.29, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.365, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.44, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.515, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.59, -0.05),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
////////////////////////////////////////////////////////////////
                  Align(
                      alignment: Alignment(-0.46, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.385, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.31, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.235, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.16, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.085, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.01, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.065, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.14, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.215, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.29, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.365, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.44, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.515, 0.17),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
////////////////////////////////////////////////////////////////
                  Align(
                      alignment: Alignment(-0.46, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.385, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.31, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.235, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.16, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.085, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.01, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.065, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.14, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.215, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.29, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.365, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.44, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.515, 0.5),
                      child: Container(
                        height: 70.0,
                        width: 25.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green),
                        ),
                      ),
                    ),
                  ]),
                ),
              )),
        ],
      ),
    );
  }
}
