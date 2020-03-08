import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
class v extends StatefulWidget {
  @override
  _vState createState() => _vState();
}

class _vState extends State<v> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FlareActor(
            'lib/assets/intro.flr',
            animation: 'coding',
          ),
        ),
      ),
    );
  }
}
