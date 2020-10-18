import 'package:flutter/foundation.dart';

class Loader with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoader() {
    _isLoading = true;
    notifyListeners();
  }

  void unsetLoader() {
    _isLoading = false;
    notifyListeners();
  }

  void toggleLoader() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
