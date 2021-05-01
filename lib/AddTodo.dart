import 'package:flutter/material.dart';
import 'package:todo/Database.dart';
import 'package:todo/MyTodos.dart';
import 'package:todo/Todo.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final DatabaseService bd = DatabaseService();
  String _title='';
  String _description='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.teal.shade50,
        appBar: new AppBar(
          leading: GestureDetector(
            child: new Icon(Icons.arrow_back),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyTodos()),
              );
            },
          ),
          backgroundColor: Colors.teal.shade900,
          title: new Text('Add a todo'),
          elevation: 20.0,
        ),
        body: SingleChildScrollView(
          child: new Container(
            child: new Form(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      'Add a new Todo',
                      style: new TextStyle(fontSize: 18.0 ,),
                    ),
                    new SizedBox(height: 20.0,),
                    new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "Todo's title",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade800, width: 2.0)
                        ),
                      ),
                      onChanged: (val)=> setState(()=> _title = val),
                    ),
                    new SizedBox(height: 20.0,),
                    new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "Todo's description",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal.shade800, width: 2.0)
                        ),
                      ),
                      onChanged: (val)=> setState(()=> _description = val),
                    ),
                    new SizedBox(height: 20.0,),
                    new RaisedButton(
                      color: Colors.teal.shade800,
                      child: new Text(
                        'Save',
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () async{
                        print('1');
                        await bd.addTodo(new Todo(_title, _description,false));
                        print('2');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyTodos()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
