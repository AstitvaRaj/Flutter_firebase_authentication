import 'package:flutter/material.dart';
import 'package:ins/login.dart';
import 'package:ins/splashscreen.dart';
import 'package:ins/suc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('lib/assets/lock.jpg'), context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'SIH 2k20',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Flare'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>v()));
              },
            ),
            FlatButton(
              child: Text('Login'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));
              },
            ),

          ],
        ),
      ),
    );
  }
}
