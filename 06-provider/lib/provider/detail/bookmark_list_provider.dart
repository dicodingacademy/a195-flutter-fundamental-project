// todo-02-list-01: create a bookmark list provider
import 'package:flutter/widgets.dart';
import 'package:tourism_app/model/tourism.dart';

class BookmarkListProvider extends ChangeNotifier {
  // todo-02-list-02: add a list state to collect an item
  final List<Tourism> _bookmarkList = [];

  // todo-02-list-03: add a get of list state
  List<Tourism> get bookmarkList => _bookmarkList;

  // todo-02-list-04: create a function to add a list item
  void addBookmark(Tourism value) {
    _bookmarkList.add(value);
    notifyListeners();
  }

  // todo-02-list-05: create a function to remove a list item
  void removeBookmark(Tourism value) {
    _bookmarkList.removeWhere((element) => element.id == value.id);
    notifyListeners();
  }

  // todo-02-list-06: create a function to check neither is exist or not
  bool checkItemBookmark(Tourism value) {
    final tourismInList =
        _bookmarkList.where((element) => element.id == value.id);
    return tourismInList.isNotEmpty;
  }
}
