import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[100],
      child: Center(
        child: new SpinKitCubeGrid(
          color: Colors.teal,
          size: 50.0,
        ),
      ),
    );
  }
}
