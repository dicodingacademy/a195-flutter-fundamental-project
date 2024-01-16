import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';

// todo-02: add onTap parameter in Tourism Card
class TourismCard extends StatelessWidget {
  final Tourism tourism;
  final Function() onTap;

  const TourismCard({
    super.key,
    required this.tourism,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tourism.name,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        tourism.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
      ),
      onTap: onTap,
    );
  }
}
