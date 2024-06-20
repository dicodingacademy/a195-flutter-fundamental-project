import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/model/tourism.dart';
import 'package:tourism_app/provider/detail/bookmark_list_provider.dart';
import 'package:tourism_app/provider/detail/bookmark_icon_provider.dart';

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
  // todo-03-bookmark-07: remove this state
  // late bool _isBookmarked;

  @override
  void initState() {
    // todo-03-bookmark-04: change the process using Provider
    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    Future.microtask(() {
      final tourismInList =
          bookmarkListProvider.checkItemBookmark(widget.tourism);
      bookmarkIconProvider.isBookmarked = tourismInList;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // todo-03-bookmark-05: replace this state using provider
        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        if (!isBookmarked) {
          bookmarkListProvider.addBookmark(widget.tourism);
        } else {
          bookmarkListProvider.removeBookmark(widget.tourism);
        }
        bookmarkIconProvider.isBookmarked = !isBookmarked;
      },
      icon: Icon(
        // todo-03-bookmark-06: change this state using Provider
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark
            : Icons.bookmark_outline,
      ),
    );
  }
}
