import 'package:flutter/material.dart';

class FavouritesAndShare extends StatelessWidget {
  final Color? iconColor;
  const FavouritesAndShare({Key? key, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.favorite_outline, color: iconColor),
        const SizedBox(width: 8),
        Icon(Icons.share, color: iconColor)
      ],
    );
  }
}
