import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:ins/loginlist.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ins/start.dart';
class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> with TickerProviderStateMixin{
  Animation animation,animation1,animation2,animation3,animation4;
  AnimationController animationController,animationController1;
  @override
  void initState() {

    Image.asset('lib/assets/lock.jpg');
    animationController = AnimationController(duration: Duration(seconds: 2),vsync: this);
    animationController1 = AnimationController(duration: Duration(milliseconds: 1500),vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animation1 = Tween(begin: -0.7,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Curves.fastOutSlowIn));
    animation2 = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Interval(0.0,1.0,curve: Curves.fastOutSlowIn)));
    animation3 = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Interval(0.5,1.0,curve: Curves.fastOutSlowIn)));
    animation4 = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Interval(0.75,1.0,curve: Curves.fastOutSlowIn)));

    animationController.forward();
    animationController1.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width:width,
          child: Stack(
            children: <Widget>[
              AnimatedBuilder(
                animation: animation,
                builder: (context,child){
                  return Opacity(
                    opacity:animation.value,
                    child: Container(
                      height: height,
                      width: width,
                      child: Image.asset('lib/assets/lock.jpg',height: height,width: width,fit: BoxFit.fitHeight,),
                    ),

                  );
                },
              ),
              AnimatedBuilder(
                animation: animationController1,
                builder: (context,child){
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        top: height*0.4,
                        left: width*0.1,
                        child: Transform(
                          transform: Matrix4.translationValues(0.0,animation1.value*height,  0.0),
                          child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 55),),
                        )
                      ),
                      Positioned(
                          top: height*0.55,
                          left: width*0.1,
                          child: Column(
                            children: <Widget>[
                              Transform(
                                transform: Matrix4.translationValues(animation2.value*width,0.0,  0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  width: width*0.8,
                                  child: FlatButton(
                                    child: Center(child: Text('Sign In with Email ID',style: TextStyle(color: Colors.white,fontSize: 20),),),
                                    onPressed: (){
                                      Navigator.push((context), MaterialPageRoute(builder: (context)=>loginlist()));
                                    },
                                  ),
                                ),
                              ),
                              Container(height: height*0.03,),
                              Transform(
                                transform: Matrix4.translationValues(animation3.value*width,0.0,  0.0),
                                child: Container(width: width*0.8,
                                  decoration: BoxDecoration(color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: FlatButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Image.asset("lib/assets/google.png",width: width*0.075,),
                                          Text('With Google+',style: TextStyle(color: Colors.red,fontSize: 20),),
                                        ],
                                      ),
                                    onPressed: (){

                                    },
                                  ),
                                ),
                              ),

                              Container(height: height*0.03,),
                              Transform(
                                transform: Matrix4.translationValues(animation4.value*width,0.0,  0.0),
                                child: Container(width: width*0.8,
                                  decoration: BoxDecoration(color: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: FlatButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Image.asset("lib/assets/facebook.png",width: width*0.075,),
                                          Text('With FACEBOOK',style: TextStyle(color: Colors.white,fontSize: 20),),
                                        ],
                                      )
                                  ),
                                )
                              ),

                            ],
                          )
                      )
                    ],
                  );
                },
              ),




            ],
          ),
        ),
      )
    );
  }
}
