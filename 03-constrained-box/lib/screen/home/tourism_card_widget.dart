import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';

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
        // todo-01: wrap Column with Row to create a new item
        // make it CrossAxisAlignment.start to placed all item in left side
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo-02: add image from tourism object
            // look at the output and make it more viewable
            ConstrainedBox(
              // todo-03: add ConstrainedBox for maximize the image
              constraints: const BoxConstraints(
                maxHeight: 80,
                minHeight: 80,
                maxWidth: 120,
                minWidth: 120,
              ),
              // todo-06: make it more rounded
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  tourism.image,
                  // todo-05: add fit to cover the available space
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // todo-07: add space to divide image and text
            const SizedBox.square(dimension: 8),
            // todo-04: add Expanded to make sure it fully in card
            Expanded(
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
                  // todo-08: Make it more attractive UI
                  const SizedBox.square(dimension: 6),
                  Row(
                    children: [
                      const Icon(Icons.pin_drop),
                      const SizedBox.square(dimension: 4),
                      Expanded(
                        child: Text(
                          tourism.address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox.square(dimension: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      const SizedBox.square(dimension: 4),
                      Expanded(
                        child: Text(
                          tourism.like.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
