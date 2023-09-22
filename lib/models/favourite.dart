class FavouriteRequest {
  final bool isFavourite;

  const FavouriteRequest({
    required this.isFavourite,
  });

  Map<String, dynamic> toJson() {
    return {
      'isFavourite': isFavourite,
    };
  }
}
