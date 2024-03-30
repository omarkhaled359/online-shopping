import 'package:flutter/cupertino.dart';

class ModelHub extends ChangeNotifier {
  bool isLoading = false;

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}