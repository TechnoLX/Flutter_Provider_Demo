import 'package:flutter/material.dart';
import 'package:flutter_video/items.dart';

//create item model which extends ChangeNotifier
class DemoModel extends ChangeNotifier {
  List<Items> _items = [];

  //get total count of items added to cart
  int get count {
    return _items.length;
  }

  //return added items
  List<Items> get list {
    return _items;
  }

  //add items to cart
  void addItems(Items item) {
    _items.add(item);
    notifyListeners(); //notify when state changes
  }

  //delete items to cart
  void removeItem(Items item) {
    _items.remove(item);
    notifyListeners();
  }
}
