import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ins/splashscreen.dart';
import 'package:ins/start.dart';
import 'package:ins/views/home.dart';
class loginlist extends StatefulWidget {
  @override
  _loginlistState createState() => _loginlistState();
}

class _loginlistState extends State<loginlist> with TickerProviderStateMixin{
  Animation animation,animation1,animation2,animation3,animation4;
  AnimationController animationController,animationController1;
  String Email,password;
  @override
  void initState() {

    Image.asset('lib/assets/lock.jpg');
    animationController = AnimationController(duration: Duration(seconds: 2),vsync: this);
    animationController1 = AnimationController(duration: Duration(milliseconds: 1500),vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animation1 = Tween(begin: -0.7,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Curves.easeIn));
    animation2 = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Interval(0.0,1.0,curve: Curves.fastOutSlowIn)));
    animation3 = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Interval(0.4,1.0,curve: Curves.fastOutSlowIn)));
    animation4 = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController1,curve: Interval(0.8,1.0,curve: Curves.fastOutSlowIn)));

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
                            child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 55),),
                        ),
                        Positioned(
                            top: height*0.55,
                            left: width*0.1,
                            child: Column(
                              children: <Widget>[
                                Transform(
                                  transform: Matrix4.translationValues(animation2.value*width,0.0,  0.0),
                                  child: Container(
                                    width: width*0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration:InputDecoration(

                                        labelText: 'Email',
                                        labelStyle: TextStyle(color: Colors.white),

                                        fillColor: Colors.grey.withOpacity(0.7),
                                        filled: true,
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(color: Colors.white)
                                        ),
                                        hoverColor: Colors.white,
                                        contentPadding: EdgeInsets.only(top: 50,left: 30,right: 25),

                                      ),
                                      cursorColor: Colors.white,
                                      onChanged: (String a){
                                        Email =a;
                                        print(Email);
                                      },

                                    ),
                                  ),
                                ),
                                Container(height: height*0.03,),
                                Transform(
                                  transform: Matrix4.translationValues(animation3.value*width,0.0,  0.0),
                                  child: Container(
                                    width: width*0.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration:InputDecoration(

                                        labelText: 'Password',
                                        labelStyle: TextStyle(color: Colors.white),

                                        fillColor: Colors.grey.withOpacity(0.7),
                                        filled: true,
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide(color: Colors.white),

                                        ),
                                        hoverColor: Colors.white,
                                        contentPadding: EdgeInsets.only(top: 50,left: 30,right: 25),

                                      ),
                                      obscureText: true,
                                      cursorColor: Colors.white,
                                      onChanged: (String a){
                                        password =a;
                                        print(password);
                                      },

                                    ),
                                  ),
                                ),

                                Container(height: height*0.03,),
                                Transform(
                                    transform: Matrix4.translationValues(animation4.value*width,0.0,  0.0),
                                    child: Container(
                                      width: width*0.8,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            width: width*0.36,
                                            height: height*0.05,
                                            decoration: BoxDecoration(color:Colors.green,
                                                borderRadius: BorderRadius.all(Radius.circular(20))),

                                            child: GestureDetector(
                                              child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white),),),
                                              onTap: (){
                                                print(Email);
                                                print(password);
                                                FirebaseAuth.instance.signInWithEmailAndPassword(email: Email, password: password).then((signedInUser){
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                                });

                                              },
                                            ),
                                          ),
                                          Container(
                                            width: width*0.36,
                                            height: height*0.05,
                                            decoration: BoxDecoration(color:Colors.blueAccent,
                                                borderRadius: BorderRadius.all(Radius.circular(30))),

                                            child: GestureDetector(
                                              onTap:(){print('working');},
                                              child: Center(child: Text('Sign up',style: TextStyle(color: Colors.white),),),
                                            ),
                                          ),
                                        ],
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
