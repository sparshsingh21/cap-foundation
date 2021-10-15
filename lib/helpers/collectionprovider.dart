//@dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProvider extends ChangeNotifier {
  String _uid;
  String get uid => _uid;
  String _name;
  String get name => _name;

  void uidSetter(String uId) {
    _uid = uId;
  }

  void nameSetter(String nAme) {
    _name = nAme;
  }
}
