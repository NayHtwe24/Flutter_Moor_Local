import 'package:flutter/material.dart';

class ServerKey with ChangeNotifier {
  static const String = "Test Key";
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }

}