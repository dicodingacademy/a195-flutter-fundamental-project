// todo-logic-02: set this widget into stateful widget
import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Tourism tourism;

  const BookmarkIconWidget({
    super.key,
    required this.tourism,
  });

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  // todo-logic-03: create local variable called _isBookmarked
  late bool _isBookmarked;

  // todo-logic-04: set a local variable from bookmark list value
  @override
  void initState() {
    final tourismInList =
        bookmarkTourismList.where((element) => element.id == widget.tourism.id);
    setState(() {
      if (tourismInList.isNotEmpty) {
        _isBookmarked = true;
      } else {
        _isBookmarked = false;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // todo-logic-04: add a logic to add a bookmark
      // when is already exist in bookmark, remove it
      onPressed: () {
        setState(() {
          if (!_isBookmarked) {
            bookmarkTourismList.add(widget.tourism);
          } else {
            bookmarkTourismList
                .removeWhere((element) => element.id == widget.tourism.id);
          }
          _isBookmarked = !_isBookmarked;
        });
      },
      // todo-logic-0: show the bookmark icon based on _isBookmarked
      icon: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
      ),
    );
  }
}
