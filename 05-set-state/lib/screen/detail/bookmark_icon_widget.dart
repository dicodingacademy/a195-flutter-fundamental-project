// todo-04-logic-02: set this widget into stateful widget
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
  // todo-04-logic-03: create local variable called _isBookmarked
  late bool _isBookmarked;

  // todo-04-logic-04: set a local variable from bookmark list value
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
      // todo-04-logic-05: add a logic to add a bookmark
      // when is already exist in bookmark, remove it
      onPressed: () {
        setState(() {
          if (_isBookmarked) {
            bookmarkTourismList
                .removeWhere((element) => element.id == widget.tourism.id);
          } else {
            bookmarkTourismList.add(widget.tourism);
          }
          _isBookmarked = !_isBookmarked;
        });
      },
      // todo-04-logic-06: show the bookmark icon based on _isBookmarked
      icon: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
      ),
    );
  }
}
