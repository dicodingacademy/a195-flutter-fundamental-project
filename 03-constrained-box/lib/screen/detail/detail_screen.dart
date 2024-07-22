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
        title: const Text("Tourism Detail"),
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
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          tourism.address,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.favorite),
                      const SizedBox.square(dimension: 4),
                      Text(tourism.like.toString())
                    ],
                  ),
                ],
              ),
              const SizedBox.square(dimension: 16),
              Text(
                tourism.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
