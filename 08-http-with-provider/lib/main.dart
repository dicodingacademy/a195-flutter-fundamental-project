import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/api/api_services.dart';
import 'package:tourism_app/provider/detail/bookmark_list_provider.dart';
import 'package:tourism_app/provider/detail/tourism_detail_provider.dart';
import 'package:tourism_app/provider/home/tourism_list_provider.dart';
import 'package:tourism_app/provider/main/index_nav_provider.dart';
import 'package:tourism_app/screen/detail/detail_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';
import 'package:tourism_app/screen/main/main_screen.dart';
import 'package:tourism_app/static/navigation_route.dart';
import 'package:tourism_app/style/theme/tourism_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkListProvider(),
        ),
        // todo-04-inject-01: register the tourism list provider
        Provider(
          create: (context) => ApiServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => TourismListProvider(
            context.read<ApiServices>(),
          ),
        ),
        // todo-04-inject-02: register the tourism detail provider
        ChangeNotifierProvider(
          create: (context) => TourismDetailProvider(
            context.read<ApiServices>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      theme: TourismTheme.lightTheme,
      darkTheme: TourismTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const MainScreen(),
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.homeRoute.name: (context) => const HomeScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              tourismId: ModalRoute.of(context)?.settings.arguments as int,
            ),
      },
    );
  }
}
