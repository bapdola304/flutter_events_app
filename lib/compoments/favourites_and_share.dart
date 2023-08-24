import 'package:flutter/material.dart';

class FavouritesAndShare extends StatelessWidget {
  const FavouritesAndShare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.favorite_outline),
        SizedBox(width: 8),
        Icon(Icons.share)
      ],
    );
  }
}
