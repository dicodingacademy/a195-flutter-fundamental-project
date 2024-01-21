import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';

class DetailScreen extends StatelessWidget {
  final Tourism tourism;

  const DetailScreen({
    super.key,
    required this.tourism,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
        // todo-init-02: add button to call action bookmark
        actions: [
          // todo-logic-01: extract this widget into a new widget
          // pass a tourism value to this widget
          FavoriteIconWidget(tourism: tourism),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                tourism.image,
                fit: BoxFit.cover,
              ),
              const SizedBox.square(dimension: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tourism.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          tourism.address,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox.square(dimension: 4),
                      Text(
                        tourism.like.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox.square(dimension: 16),
              Text(
                tourism.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// todo-logic-02: set this widget into stateful widget
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
  // todo-logic-03: create local variable called _isBookmarked
  late bool _isBookmarked;

  // todo-logic-04: set a local variable from bookmark list value
  @override
  void didChangeDependencies() {
    final tourismInList =
        bookmarkTourismList.where((element) => element == widget.tourism);
    setState(() {
      if (tourismInList.isNotEmpty) {
        _isBookmarked = true;
      } else {
        _isBookmarked = false;
      }
    });

    super.didChangeDependencies();
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
                .removeWhere((element) => element == widget.tourism);
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
