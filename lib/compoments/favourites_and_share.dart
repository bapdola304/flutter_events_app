import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FavouritesAndShare extends StatelessWidget {
  final Color? iconColor;
  final bool? isFavourite;
  final Function()? onFavouritePressed;
  const FavouritesAndShare(
      {Key? key, this.iconColor, this.isFavourite, this.onFavouritePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ZoomTapAnimation(
          onTap: onFavouritePressed,
          begin: 1.0,
          end: 3.0,
          child: Icon(
              isFavourite == true ? Icons.favorite : Icons.favorite_outline,
              color: isFavourite == true ? const Color(0xFFF01717) : iconColor),
        ),
        const SizedBox(width: 8),
        Icon(Icons.share, color: iconColor)
      ],
    );
  }
}
