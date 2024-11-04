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
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tourism.name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              tourism.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
