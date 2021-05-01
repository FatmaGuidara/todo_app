import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Todo.dart';

class DatabaseService {

  final databaseRefrenceTodos = Firestore.instance.collection("todos");

  // Create a todo
  void addTodo(Todo todo) async {
    await databaseRefrenceTodos
        .document()
        .setData({
      'title': todo.title,
      'description': todo.description,
      'isDone': todo.isDone,
    });
  }

  // Update a todo
  void updateTodo(String id,Todo todo) async {
    await databaseRefrenceTodos
        .document(id)
        .setData({
      'title': todo.title,
      'description': todo.description,
      'isDone': todo.isDone,
    });
  }

  // Delete todo by id
  void deleteDataById(String id) {
    try {
      databaseRefrenceTodos
          .document(id)
          .delete();
    } catch (e) {}
  }

  // Get todos
  Stream<List<Todo>> get todos{
    return databaseRefrenceTodos.snapshots().map(_snapshotToBookList);
  }

  List<Todo> _snapshotToBookList(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Todo(doc.data['title'],doc.data['description'],doc.data['isDone']);
    }).toList();
  }
}