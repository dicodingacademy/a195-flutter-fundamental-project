import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/model/tourism.dart';
import 'package:tourism_app/provider/detail/bookmark_list_provider.dart';
import 'package:tourism_app/provider/detail/bookmark_icon_provider.dart';

class FavoriteIconWidget extends StatefulWidget {
  final Tourism tourism;

  const FavoriteIconWidget({
    super.key,
    required this.tourism,
  });

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  // todo-bookmark-07: remove this state
  // late bool _isBookmarked;

  @override
  void initState() {
    // todo-bookmark-04: change the process using Provider
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
        // todo-bookmark-05: replace this state using provider
        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        if (!isBookmarked) {
          bookmarkListProvider.addBookmark(widget.tourism);
        } else {
          bookmarkListProvider.removeBookmark(widget.tourism);
        }
        context.read<BookmarkIconProvider>().isBookmarked = !isBookmarked;
      },
      icon: Icon(
        // todo-bookmark-06: change this state using Provider
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark
            : Icons.bookmark_outline,
      ),
    );
  }
}
