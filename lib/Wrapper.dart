import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Authentificate.dart';
import 'package:todo/MyTodos.dart';
import 'User.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return new Authentificate();
    }else{
      return new MyTodos();
    }
  }
}
