import 'package:flutter/material.dart';
import 'package:shopping_list/authenticate/register.dart';
import 'package:shopping_list/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  //Check if user is registering or signing in
  bool signedIn = false;

  void view(){
    setState(() {
      signedIn = !signedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
   if(signedIn){
     return SignIn(view: view);
   }else{
     return Register(view: view);
   }
  }
}
