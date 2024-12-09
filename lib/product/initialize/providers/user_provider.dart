import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';

final class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
