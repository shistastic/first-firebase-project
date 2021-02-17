import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/model/list.dart';

class DbConn {

  final String uid;
  DbConn({ this.uid });

  //Collection reference
  final CollectionReference shopCollection = Firestore.instance.collection('shopping');

  Future updateUserData(String product, String name, int quantity) async{
    return await shopCollection.document(uid).setData({
      'product': product,
      'name': name,
      'quantity': quantity,
    });
  }

  //Shopping list snapshot
  List<ShopList> _listFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((i){
      return ShopList(
        product: i.data['product'] ?? '',
        name: i.data['name'] ?? '',
        quantity: i.data['quantity'] ?? 0,
      );
    }).toList();
  }


  // Get shopping stream
Stream<List<ShopList>> get shopping {
    return shopCollection.snapshots().map(_listFromSnapshot);
}

}