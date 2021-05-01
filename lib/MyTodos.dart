import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/AddTodo.dart';
import 'package:todo/Authentification.dart';
import 'package:todo/Database.dart';

import 'Todo.dart';
class MyTodos extends StatefulWidget {
  @override
  _MyTodosState createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> {
  AuthentificationService _auth = AuthentificationService();
  DatabaseService bd = DatabaseService();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal.shade900,
        title: new Text('My Todos'),
        elevation: 20.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.white,),
            label: new Text("Logout",style: TextStyle(color: Colors.white),),
            onPressed: ()async{
              await _auth.signout();
            },
          ),
        ],
      ),
      backgroundColor: Colors.teal.shade50,
      body: new Container(
        child: new StreamBuilder(
            stream: Firestore.instance.collection('todos').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                print('nada');
                return Center(child: CircularProgressIndicator(),);
              }else{
                print('data');
                return new ListView(
                  children: snapshot.data.documents.map((document){
                    return CheckboxListTile(
                      value: document['isDone'],
                      title: new Text(document['title']),
                      secondary: GestureDetector(
                        child: new Icon(Icons.delete, color: Colors.teal.shade800,),
                        onTap: (){
                          String id = document.documentID;
                          bd.deleteDataById(id);
                        },
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      subtitle: new Text(document['description']),
                      onChanged: (bool val){
                        setState(() {
                          Todo todo = new Todo(document['title'],document['description'],!document['isDone']);
                          String id=document.documentID;
                          bd.updateTodo(id, todo);
                        });
                      },
                      activeColor: Colors.teal.shade800,
                      checkColor: Colors.white,
                    );
                  }).toList(),
                );
              }
            }
        ),
        /**/
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.teal.shade800,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodo()),
          );
        },
      ),
    );
  }
}


