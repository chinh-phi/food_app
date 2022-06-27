import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app_247/app/modules/merchant/models/cart_item_model.dart';
import 'package:food_app_247/app/modules/payment/models/payment_order_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireStoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addNewItem(CartItemModel item) async {
    var list = [];
    var docId;

    QuerySnapshot querySnapshot = await _firebaseFirestore.collection(
        'flutter_food_cart')
        .where('id', isEqualTo: item.id)
        .get();

    if(querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        // print(Map<String, dynamic>.from(CartItemModel.fromJson(doc.data())));
        list.add(CartItemModel.fromJson(doc.data() as Map<String, dynamic>));
        print(doc.id);
        docId = doc.id;
      }
    }

    if(list.isNotEmpty) {
      var obj = list[0];
      var number = obj.number+item.number;
      await _firebaseFirestore.collection('flutter_food_cart').doc(docId).update({'number': number, 'oldPrice': item.oldPrice!*number, 'newPrice': item.newPrice!*number, 'totalMoney': item.totalMoney!*number});
    } else {
      await _firebaseFirestore.collection('flutter_food_cart').add(item.toJson());
    }
  }

  updateItem(CartItemModel item, method) async {
    var list = [];
    var docId;

    QuerySnapshot querySnapshot = await _firebaseFirestore.collection(
        'flutter_food_cart')
        .where('id', isEqualTo: item.id)
        .get();

    if(querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        // print(Map<String, dynamic>.from(CartItemModel.fromJson(doc.data())));
        list.add(CartItemModel.fromJson(doc.data() as Map<String, dynamic>));
        print(doc.id);
        docId = doc.id;
      }
    }

    if(list.isNotEmpty) {
      var obj = list[0];
      var number = obj.number;
      var oldNumber = obj.number;
      if(method=='minus') {
        if(number == 1) {
          await _firebaseFirestore.collection('flutter_food_cart').doc(docId).delete();
        } else {
          number--;
          await _firebaseFirestore.collection('flutter_food_cart').doc(docId).update({'number': number, 'oldPrice': (item.oldPrice!*number/oldNumber).round(), 'newPrice': (item.newPrice!*number/oldNumber).round(), 'totalMoney': (item.totalMoney!*number/oldNumber).round()});
        }
      } else {
        number++;
        await _firebaseFirestore.collection('flutter_food_cart').doc(docId).update({'number': number, 'oldPrice': (item.oldPrice!*number/oldNumber).round(), 'newPrice': (item.newPrice!*number/oldNumber).round(), 'totalMoney': (item.totalMoney!*number/oldNumber).round()});
      }
    } else {

    }
  }

  deleteAllItem() async {
    final batch = _firebaseFirestore.batch();
    var collection = _firebaseFirestore.collection('flutter_food_cart');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  createOrder(PaymentOrderDetailModel item) async {
    await _firebaseFirestore.collection('order_review').add(item.toJson());
  }

  Future<PaymentOrderDetailModel> getOrder(orderId) async {
    var list = [];
    QuerySnapshot querySnapshot = await _firebaseFirestore.collection(
        'order_review')
        .where('id', isEqualTo: orderId)
        .get();

    if(querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        // print(Map<String, dynamic>.from(CartItemModel.fromJson(doc.data())));
        list.add(PaymentOrderDetailModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    } else {

    }
    return list[0];
  }

  deleteAllOrder() async {
    final batch = _firebaseFirestore.batch();
    var collection = _firebaseFirestore.collection('order_review');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }



}