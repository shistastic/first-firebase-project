
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/model/list.dart';

import 'shopTile.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    final shopping = Provider.of<List<ShopList>>(context);

    return ListView.builder(
      itemCount: shopping.length,
      itemBuilder: (context, index) {
        return ShopTile(shoplist: shopping[index]);
      }
    );

    return Container();
  }
}
