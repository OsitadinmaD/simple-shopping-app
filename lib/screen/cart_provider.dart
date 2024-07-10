import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_shopping_app/help_classes/items_model.dart';


class CartProvider extends ChangeNotifier{
 static final List<Items> _cartItems = [];

 UnmodifiableListView get cartItems => UnmodifiableListView(_cartItems);


 void add({required Items item}){
  _cartItems.add(item);
  notifyListeners();
  log('Item Added');
 } 

 void remove(int index){
  _cartItems.removeAt(index);
  notifyListeners();
 }

 double get totalPrice => _cartItems.fold<double>(
  0.0, (previousValue, element) => previousValue += (element.price),);

 

}