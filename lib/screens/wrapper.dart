import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/authenticate/authenticate.dart';
import 'package:shopping_list/home/home.dart';
import 'package:shopping_list/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);


    //Return either Home or Authenticate Widget
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
