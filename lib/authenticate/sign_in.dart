import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/style/form_inputs.dart';
import 'package:shopping_list/style/loading.dart';

class SignIn extends StatefulWidget {

  final Function view;
  SignIn({ this.view });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formVal = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  bool loading = false;

  //Form Values
  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text('Sign in to Shopping List'),
        actions: [
          FlatButton.icon(
              icon:Icon(Icons.person),
              label: Text('Register'),
              onPressed: (){
                widget.view();
              }

          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formVal,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Email Address'),
                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Password'),
                validator: (val) => val.isEmpty ? 'Enter a valid password' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    pass = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  onPressed:() async{
                    //Validate form credentials
                    if(_formVal.currentState.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInUser(email, pass);
                      if(result == null){
                        setState(() {
                          loading = false;
                          error = 'Please supply valid credentials';
                        });
                      }
                    }
                  },
                  color:Colors.amber[700],
                child: Text('Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                error,
              style: TextStyle(
                fontSize: 12.0,
                  color: Colors.pink),
              ),
            ],
          ),
        )

      ),
    );
  }
}
