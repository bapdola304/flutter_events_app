class EventModel {
  final int id;
  final String name;
  final String time;
  final String location;
  final int price;
  final String image;

  const EventModel({
    required this.id,
    required this.name,
    required this.time,
    required this.location,
    required this.price,
    required this.image,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as int,
      name: map['name'] as String,
      time: map['time'] as String,
      location: map['location'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
    );
  }
}
