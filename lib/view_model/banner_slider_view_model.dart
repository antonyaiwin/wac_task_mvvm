import 'package:flutter/material.dart';

class BannerSliderViewModel extends ChangeNotifier {
  int currentIndex = 0;
  onCarouselIndexChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
