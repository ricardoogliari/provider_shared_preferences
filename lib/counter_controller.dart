import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterController extends ChangeNotifier {

  int _counter = 0;

  int get counter => _counter;

  late SharedPreferences _prefs;

  CounterController(){
    _getSavedValue();
  }

  void _getSavedValue() async {
    _prefs = await SharedPreferences.getInstance();
    _counter = _prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  void increment() {
    _counter++;
    _prefs.setInt('counter', _counter);
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    _prefs.setInt('counter', 0);
    notifyListeners();
  }

}