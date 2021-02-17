import 'package:flutter/material.dart';
import 'package:shopping_list/model/list.dart';

class ShopTile extends StatelessWidget {

  final ShopList shoplist;
  ShopTile({this.shoplist});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown,
            radius: 25.0,
          ),
          title: Text(shoplist.name),
          subtitle: Text(shoplist.product),
        ),
      ),
    );
  }
}
