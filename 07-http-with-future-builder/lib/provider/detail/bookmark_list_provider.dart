import 'package:flutter/widgets.dart';
import 'package:tourism_app/data/model/tourism.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<Tourism> _bookmarkList = [];

  List<Tourism> get bookmarkList => _bookmarkList;

  void addBookmark(Tourism value) {
    _bookmarkList.add(value);
    notifyListeners();
  }

  void removeBookmark(Tourism value) {
    _bookmarkList.removeWhere((element) => element.id == value.id);
    notifyListeners();
  }

  bool checkItemBookmark(Tourism value) {
    final tourismInList =
        _bookmarkList.where((element) => element.id == value.id);
    return tourismInList.isNotEmpty;
  }
}
