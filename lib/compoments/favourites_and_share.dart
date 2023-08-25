import 'package:flutter/material.dart';

class FavouritesAndShare extends StatelessWidget {
  final Color? iconColor;
  final bool? isFavourite;
  const FavouritesAndShare({Key? key, this.iconColor, this.isFavourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(isFavourite == true ? Icons.favorite : Icons.favorite_outline,
            color: isFavourite == true ? const Color(0xFFF01717) : iconColor),
        const SizedBox(width: 8),
        Icon(Icons.share, color: iconColor)
      ],
    );
  }
}
