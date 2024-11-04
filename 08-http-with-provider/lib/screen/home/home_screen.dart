import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/home/tourism_list_provider.dart';
import 'package:tourism_app/screen/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';
import 'package:tourism_app/static/tourism_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // todo-02-home-13: we dont need this anymore
  // late Future<TourismListResponse> _futureTourismResponse;

  @override
  void initState() {
    super.initState();
    // todo-02-home-13: we dont need this anymore
    // _futureTourismResponse = ApiServices().getTourismList();
    // todo-02-home-09: load the api using Provider
    Future.microtask(() {
      context.read<TourismListProvider>().fetchTourismList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
      ),
      // todo-02-home-10: comment this code below
      // todo-02-home-11: add a Consumer to maintain the result state
      body: Consumer<TourismListProvider>(
        builder: (context, value, child) {
          // todo-02-home-12: use sealed class to define a various state
          return switch (value.resultState) {
            TourismListLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            TourismListLoadedState(data: var tourismList) => ListView.builder(
                itemCount: tourismList.length,
                itemBuilder: (context, index) {
                  final tourism = tourismList[index];

                  return TourismCard(
                    tourism: tourism,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavigationRoute.detailRoute.name,
                        arguments: tourism.id,
                      );
                    },
                  );
                },
              ),
            TourismListErrorState(error: var message) => Center(
                child: Text(message),
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
