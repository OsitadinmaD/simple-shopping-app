import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:simple_shopping_app/help_classes/items_model.dart';

class CartProvider extends ChangeNotifier{
  final List<Items> _cartItems = [];
  int _totalQuantity = 1;
  double itemTotalPrice = 0;
  

  UnmodifiableListView get cartItems => UnmodifiableListView(_cartItems);

  void addItem(Items item){
    if(cartItems.contains(item)){
      cartItems.remove(item);
    }
    _cartItems.add(item);
    notifyListeners();
  }
  
  void removeItem(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
 
  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }

  void incrementQuantity({required Items item}){
    itemTotalPrice = item.price * _totalQuantity++;
    notifyListeners();
  }

  void decrementQuantity({required Items item}){
    if(_totalQuantity != 1){
    itemTotalPrice = _totalQuantity-- * item.price;
    }
    notifyListeners();
  }

  int get totalQuantity => _totalQuantity;



  double  get totalPrice => cartItems.fold(0.0, (previousTotal, newPrice) => previousTotal += (newPrice.price * _totalQuantity),);
}