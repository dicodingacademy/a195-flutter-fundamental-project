// todo-02-bookmark-01: create a BookmarkScreen
import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';
import 'package:tourism_app/static/navigation_route.dart';

import '../home/tourism_card_widget.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark List"),
      ),
      // todo-02-bookmark-02: create a bookmark tourism list
      body: ListView.builder(
        itemCount: bookmarkTourismList.length,
        itemBuilder: (context, index) {
          // todo-02-bookmark-03: use TourismCard to create a item list
          final tourism = bookmarkTourismList[index];

          return TourismCard(
            tourism: tourism,
            onTap: () {
              Navigator.pushNamed(
                context,
                NavigationRoute.detailRoute.name,
                arguments: tourism,
              );
            },
          );
        },
      ),
    );
  }
}
