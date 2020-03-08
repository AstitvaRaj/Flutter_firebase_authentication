import 'package:flutter/material.dart';
import 'package:ins/login.dart';
import 'package:wave/config.dart';
import 'dart:async';
import 'package:wave/wave.dart';
import 'package:flutter/animation.dart';
class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}
class _splashscreenState extends State<splashscreen> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;
  @override
void initState() {
  super.initState();
  animationController =
      AnimationController(duration: Duration(seconds: 2), vsync: this);
  animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn));
  animationController.forward();
  Timer(
      Duration(seconds: 5), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> loginscreen()))
  );

  }

@override
Widget build(BuildContext context) {

  final double height = MediaQuery.of(context).size.height;
  final double width = MediaQuery.of(context).size.width;
  return Scaffold(
    body: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.05,
                0.9,
              ],

              colors: <Color>[
                Colors.black,
                Colors.blue,
              ]
          )
      ),

      child: Stack(
        children: <Widget>[
          Positioned(
              top: height*0.8,

              child: Container(
                height: height,
                width: width,
                color: Colors.transparent,
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [Colors.blue,Colors.lightBlueAccent],
                    blur: MaskFilter.blur(BlurStyle.inner, 100),
                    durations: [5000,3000],
                    heightPercentages: [0.0,0.0],
                  ),
                  waveAmplitude: 25,
                  wavePhase: 10,
                  heightPercentange: 0.4,
                  size: Size(double.infinity, double.infinity),
                ),
              )
          ),
          Positioned(
            top: height*0.3,
            left: 0,
            child: Container(
              width: width,
              child: Center(
                child:AnimatedBuilder(
                  animation: animation,
                  builder: (context,child){
                    return Opacity(
                      opacity:animation.value,
                      child: Text('SIH 2k20',style: TextStyle(color: Colors.white,fontSize: 40),
                      ),
                    );
                  },
                )
            ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
