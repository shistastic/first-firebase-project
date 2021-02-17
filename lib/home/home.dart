
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/home/shopping_list.dart';
import 'package:shopping_list/model/list.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/services/dbconn.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ShopList>>.value(
      value: DbConn().shopping,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text('Shopping List'),
          backgroundColor: Colors.amber[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async{
                  await _auth.signOut();
                },
                label: Text('Sign Out'),
                icon:Icon(Icons.person),

            ),
          ],
        ),
        body: ShoppingList(),
      ),
    );
  }
}
