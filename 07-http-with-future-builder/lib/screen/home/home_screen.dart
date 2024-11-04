import 'package:flutter/material.dart';
import 'package:tourism_app/data/api/api_services.dart';
import 'package:tourism_app/data/model/tourism_list_response.dart';
import 'package:tourism_app/screen/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';

// todo-03-home-01: make this widget StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // todo-03-home-02: add a local state that containt a Future
  late final Future<TourismListResponse> _futureTourismResponse;

  // todo-03-home-03: initialize a state from initState function
  @override
  void initState() {
    super.initState();
    _futureTourismResponse = ApiServices().getTourismList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
      ),
      // todo-03-home-04: comment the ListView widget first, we take it later
      // todo-03-home-05: create a FutureBuilder
      body: FutureBuilder(
        future: _futureTourismResponse,
        builder: (context, snapshot) {
          // todo-03-home-06: define a widget based on state
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              // todo-03-home-07: define a widget base on error or has data
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              final listOfTourism = snapshot.data!.places;
              return ListView.builder(
                itemCount: listOfTourism.length,
                itemBuilder: (context, index) {
                  final tourism = listOfTourism[index];

                  return TourismCard(
                    tourism: tourism,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        NavigationRoute.detailRoute.name,
                        // todo-04-detail-13: dont forget to change the value too
                        arguments: tourism.id,
                      );
                    },
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
