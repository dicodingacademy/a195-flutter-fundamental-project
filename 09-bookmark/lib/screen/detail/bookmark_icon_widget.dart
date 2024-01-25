import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/model/tourism.dart';
import 'package:tourism_app/provider/bookmark/local_database_provider.dart';
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
  @override
  void initState() {
    // todo-action-02: change this provider using LocalDatabaseProvider
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    Future.microtask(() async {
      // todo-action-03: change this action using LocalDatabaseProvider
      await localDatabaseProvider.loadTourismValueById(widget.tourism.id);
      final value = localDatabaseProvider.tourism == null
          ? false
          : localDatabaseProvider.tourism!.id == widget.tourism.id;
      bookmarkIconProvider.isBookmarked = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        // todo-action-04: change this action using LocalDatabaseProvider
        final localDatabaseProvider = context.read<LocalDatabaseProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        // todo-action-05: change this action using LocalDatabaseProvider
        if (!isBookmarked) {
          await localDatabaseProvider.saveTourismValue(widget.tourism);
        } else {
          await localDatabaseProvider.removeTourismValueById(widget.tourism.id);
        }
        bookmarkIconProvider.isBookmarked = !isBookmarked;
        // todo-action-06: add this action to load the page
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
