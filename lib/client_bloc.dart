import 'package:flutter/material.dart';
import 'package:flutter_app/models/pro.dart';

class ClientBloc with ChangeNotifier {
  Pro _pro;
  Pro get pro => _pro;
  double _price = 0;
  double get price => _price;
  String _selectedEmployee;
  String get selectedEmployee => _selectedEmployee;

  void setPro(Pro newPro) {
    _pro = newPro;
  }

  void setPrice(newPrice) {
    _price = newPrice;
    notifyListeners();
  }

  void selectEmployee(String name) {
    _selectedEmployee = name;
    notifyListeners();
  }
}