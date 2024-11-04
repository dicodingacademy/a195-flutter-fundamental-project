// todo-03-bookmark-01: create a new provider to handle the Fav Icon
import 'package:flutter/widgets.dart';

class BookmarkIconProvider extends ChangeNotifier {
  // todo-03-bookmark-02: add a boolean state to handle the fav icon
  bool _isBookmarked = false;

  // todo-03-bookmark-03: add get-set to that state
  bool get isBookmarked => _isBookmarked;

  set isBookmarked(bool value) {
    _isBookmarked = value;
    notifyListeners();
  }
}
