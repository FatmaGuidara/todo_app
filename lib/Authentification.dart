import 'package:firebase_auth/firebase_auth.dart';

import 'User.dart';

class AuthentificationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _FirebaseToUser(FirebaseUser user){
    return user!=null?User(uid: user.uid):null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_FirebaseToUser);
  }

  // Sign in
  Future SignInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _FirebaseToUser(user);
    }catch(e){
      return null;
    }
  }

  // Register
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _FirebaseToUser(user);
    }catch(e){
      return null;
    }
  }

  // Sign out
  Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      return null;
    }
  }
}