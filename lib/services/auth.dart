import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping_list/model/user.dart';
import 'package:shopping_list/services/dbconn.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user objecto from FirebaseUser
  User _userFromFBU(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth User Object Stream Control
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFBU);
  }

  // Sign In Anonymous
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFBU(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Sign In user with email and password
  Future signInUser(String email, String pass) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return _userFromFBU(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register user with email and password
  Future registerUser(String email, String pass) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;

      //Create new record for new user
      await DbConn(uid: user.uid).updateUserData('Chocolate', 'Adam', 2);

      return _userFromFBU(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
    }
  }


}