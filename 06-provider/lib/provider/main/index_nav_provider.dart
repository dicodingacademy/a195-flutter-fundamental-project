import 'package:flutter/widgets.dart';

// todo-main-01: create a change notifier for index bottom nav
class IndexNavProvider extends ChangeNotifier{
  // todo-main-02: add a state that contain index nav
  int _indexBottomNavBar = 0;

  // todo-main-03: add get method for that index bottom nav
  int get indexBottomNavBar => _indexBottomNavBar;

  // todo-main-04: add set method for index bottm nav like basic function
  set setIndextBottomNavBar(int value){
    _indexBottomNavBar = value;
    // todo-main-05: dont forget to notify 
    notifyListeners();
  }
}