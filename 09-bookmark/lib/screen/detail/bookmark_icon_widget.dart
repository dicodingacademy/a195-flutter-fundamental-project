import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/model/tourism.dart';
import 'package:tourism_app/provider/bookmark/local_database_provider.dart';
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
  @override
  void initState() {
    super.initState();
    // todo-03-action-02: change this provider using LocalDatabaseProvider
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    Future.microtask(() async {
      // todo-03-action-03: change this action using LocalDatabaseProvider
      await localDatabaseProvider.loadTourismValueById(widget.tourism.id);
      final value = localDatabaseProvider.tourism == null
          ? false
          : localDatabaseProvider.tourism!.id == widget.tourism.id;
      bookmarkIconProvider.isBookmarked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        // todo-03-action-04: change this action using LocalDatabaseProvider
        final localDatabaseProvider = context.read<LocalDatabaseProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        // todo-03-action-05: change this action using LocalDatabaseProvider
        if (isBookmarked) {
          await localDatabaseProvider.removeTourismValueById(widget.tourism.id);
        } else {
          await localDatabaseProvider.saveTourismValue(widget.tourism);
        }
        bookmarkIconProvider.isBookmarked = !isBookmarked;
        // todo-03-action-06: add this action to load the page
        localDatabaseProvider.loadAllTourismValue();
      },
      icon: Icon(
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark
            : Icons.bookmark_outline,
      ),
    );
  }
}
