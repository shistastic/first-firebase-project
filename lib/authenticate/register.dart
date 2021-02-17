import 'package:flutter/material.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/style/form_inputs.dart';
import 'package:shopping_list/style/loading.dart';

class Register extends StatefulWidget {

  final Function view;
  Register({ this.view });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formVal = GlobalKey<FormState>();

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
        title: Text('Register to Shopping List'),
        actions: [
          FlatButton.icon(
            icon:Icon(Icons.person),
              label: Text('Sign In'),
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
                  validator: (val) => val.length < 6 ? 'Enter a valid password' : null,
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
                    if(_formVal.currentState.validate()){
                      loading = true;
                      dynamic result = await _auth.registerUser(email, pass);
                      if(result == null){
                         setState(() {
                           loading = false;
                           error = 'Please supply a valid email and password';
                         });
                      }
                    }
                  },
                  color:Colors.amber[700],
                  child: Text('Register',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
          )

      ),
    );
  }
}
