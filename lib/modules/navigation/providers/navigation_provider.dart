import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void navigateToHome() => setIndex(0);
  void navigateToRiwayat() => setIndex(1);
  void navigateToMonitoring() => setIndex(2);
  void navigateToArea() => setIndex(3);
  void navigateToProfile() => setIndex(4);
}
