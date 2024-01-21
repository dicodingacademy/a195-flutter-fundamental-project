// todo-main-01: create main screen to handle bottom navigation
import 'package:flutter/material.dart';
import 'package:tourism_app/screen/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // todo-main-04: to manage bottom nav bar, create a local variable
  int _indexBottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo-main-07: add body of main screen
      body: switch (_indexBottomNavBar) {
        1 => const BookmarkScreen(),
        _ => const HomeScreen(),
      },
      // todo-main-02: add bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        // todo-main-05: add parameter current index nav bar
        currentIndex: _indexBottomNavBar,
        // todo-main-06: add onTap callback to manage a state
        onTap: (index) {
          setState(() {
            _indexBottomNavBar = index;
          });
        },
        items: const [
          // todo-main-03: add bottom nav bar item
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
