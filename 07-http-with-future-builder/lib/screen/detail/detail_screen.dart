import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/api/api_services.dart';
import 'package:tourism_app/data/model/tourism.dart';
import 'package:tourism_app/data/model/tourism_detail_response.dart';
import 'package:tourism_app/provider/detail/bookmark_icon_provider.dart';
import 'package:tourism_app/screen/detail/body_of_detail_screen_widget.dart';
import 'package:tourism_app/screen/detail/bookmark_icon_widget.dart';

// todo-detail-07: make this widget StatefulWidget
class DetailScreen extends StatefulWidget {
  // todo-detail-04: you can change this parameter into int value
  final int tourismId;

  const DetailScreen({
    super.key,
    required this.tourismId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // todo-detail-08: create a local variable for late tourism and Future
  final Completer<Tourism> _completerTourism = Completer<Tourism>();
  late Future<TourismDetailResponse> _futureTourismDetail;

  // todo-detail-09: initialize a Future in initState
  @override
  void initState() {
    super.initState();

    _futureTourismDetail = ApiServices().getTourismDetail(widget.tourismId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Detail"),
        actions: [
          ChangeNotifierProvider(
            create: (context) => BookmarkIconProvider(),
            // todo-detail-13: change this widget using FutureBuilder
            child: FutureBuilder(
                future: _completerTourism.future,
                builder: (context, snapshot) {
                  return switch (snapshot.connectionState) {
                    ConnectionState.done =>
                      FavoriteIconWidget(tourism: snapshot.data!),
                    _ => const SizedBox(),
                  };
                }),
          ),
        ],
      ),
      // todo-detail-10: to make it easy, create a new widget below
      // todo-detail-11: create a FutureBuilder
      body: FutureBuilder(
        future: _futureTourismDetail,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              // todo-detail-12: define a widget base on error or has data
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              final tourismData = snapshot.data!.place;
              _completerTourism.complete(tourismData);
              return BodyOfDetailScreenWidget(tourism: tourismData);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}