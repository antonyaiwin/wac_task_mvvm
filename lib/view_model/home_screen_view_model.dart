import 'package:flutter/material.dart';
import 'package:wac_task/global_widgets/dummy_page.dart';

import '../view/home_screen/pages/home_page.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int selectedPageIndex = 0;

  PageController controller = PageController();
  List<Widget> pages = [
    const HomePage(),
    const DummyPage(label: 'Category'),
    const DummyPage(label: 'Cart'),
    const DummyPage(label: 'Offers'),
    const DummyPage(label: 'Account'),
  ];

  void changePage(int index) {
    selectedPageIndex = index;
    controller.jumpToPage(index);
    notifyListeners();
  }
}
