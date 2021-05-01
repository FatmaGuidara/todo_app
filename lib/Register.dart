import 'package:flutter/material.dart';
import 'Authentification.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String error = '';
  bool loading = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    AuthentificationService _auth = AuthentificationService();
    final _formKey = GlobalKey<FormState>();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.teal.shade50,
        appBar: new AppBar(
          backgroundColor: Colors.teal[800],
          title: new Text('Register'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: new Icon(Icons.person, color: Colors.white,),
              label: new Text('Sign in', style: new TextStyle(color: Colors.white),),
              onPressed: (){
                widget.toggleView();
              },
            ),
          ],
        ),
        body: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: new Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  new SizedBox(height: 20.0,),
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "email",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade800, width: 2.0)
                      ),
                    ),
                    validator: (val)=>val.isEmpty?'Please enter an email':null,
                    onChanged: (val){email=val;},
                  ),
                  new SizedBox(height: 20.0,),
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "password",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade800, width: 2.0)
                      ),
                    ),
                    validator: (val)=>val.length<6?'Please enter a 6 characters password':null,
                    obscureText: true,
                    onChanged: (val){password=val;},
                  ),
                  new SizedBox(height: 20.0,),
                  new RaisedButton(
                    color: Colors.teal[800],
                    child: new Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: ()async{
                      if(_formKey.currentState.validate()){
                        setState(() {
                          loading=true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error = 'Please supply a valid credentials';
                            loading=false;
                          });
                        }
                      }
                    },
                  ),
                  new SizedBox(height: 12.0,),
                  new Text(
                    error,
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
