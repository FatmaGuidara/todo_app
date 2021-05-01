import 'package:flutter/material.dart';
import 'package:todo/Register.dart';
import 'package:todo/SignIn.dart';

class Authentificate extends StatefulWidget {
  @override
  _AuthentificateState createState() => _AuthentificateState();
}

class _AuthentificateState extends State<Authentificate> {
  bool isSignin = false;
  void toggleView(){
    setState(() {
      isSignin= !isSignin;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isSignin?SignIn(toggleView: toggleView):new Register(toggleView: toggleView),
    );
  }
}
