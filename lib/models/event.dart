class EventModel {
  String id;
  String name;
  String time;
  String location;
  int price;
  String image;
  bool? isFavourite;

  EventModel(
      {required this.id,
      required this.name,
      required this.time,
      required this.location,
      required this.price,
      required this.image,
      this.isFavourite});

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as String,
      name: map['name'] as String,
      time: map['time'] as String,
      location: map['location'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
      isFavourite: map['isFavourite'] as bool,
    );
  }

  factory EventModel.newEvent() {
    return EventModel(
        id: '',
        name: '',
        time: '',
        location: '',
        image: '',
        price: 0,
        isFavourite: false);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'location': location,
      'image': image,
      'price': price,
      'isFavourite': isFavourite,
    };
  }
}
