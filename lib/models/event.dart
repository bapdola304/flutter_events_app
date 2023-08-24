class EventModel {
  final int id;
  final String name;
  final String time;
  final String location;
  final double price;
  final String image;

  const EventModel({
    required this.id,
    required this.name,
    required this.time,
    required this.location,
    required this.price,
    required this.image,
  });
}
