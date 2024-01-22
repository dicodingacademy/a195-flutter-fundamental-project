import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/main/index_nav_provider.dart';
import 'package:tourism_app/screen/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';

// todo-main-10: set this widget into StatelessWidget
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // todo-main-09: remove _indexBottomNavBar state
  // int _indexBottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo-main-08: use Consumer to build the screen
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavBar) {
            1 => const BookmarkScreen(),
            _ => const HomeScreen(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // todo-main-07: grab the value using watch  provider
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
        onTap: (index) {
          // todo-main-06: change the set value using provider
          context.read<IndexNavProvider>().setIndextBottomNavBar = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks),
            label: "Bookmarks",
            tooltip: "Bookmarks",
          ),
        ],
      ),
    );
  }
}
