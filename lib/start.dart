import 'package:flutter/material.dart';
class start extends StatefulWidget {
  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
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

          ),
        ),
        Container(
          height: height*0.03,
        ),
        Container(
          width: width*0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: TextFormField(
            decoration:InputDecoration(

              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white),

              fillColor: Colors.grey.withOpacity(0.7),
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white),

              ),
              contentPadding: EdgeInsets.only(top: 50,left: 30,right: 25),

            ),
            obscureText: true,
            cursorColor: Colors.white,

          ),
        ),
        Container(
          height: height*0.03,
        ),
        Container(
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
                  onTap:(){print('working');},
                  child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white),),),
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
      ],
    );
  }
}
