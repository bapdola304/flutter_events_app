import 'package:events_app/compoments/event_item.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/screens/detai_event.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<EventModel> eventList = [
    EventModel(
      id: "1",
      price: 10000,
      name: "Music concert",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Quy Nhon',
    ),
    EventModel(
      id: "2",
      price: 20000,
      name: "Football",
      image: "https://picsum.photos/200",
      time: '2023-09-25T03:23:08.073Z',
      location: 'Quy Nhon',
    ),
    EventModel(
      id: "3",
      price: 30000,
      name: "Black Pink",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    ),
    EventModel(
      id: "4",
      price: 30000,
      name: "The Wombats",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    ),
    EventModel(
      id: "5",
      price: 30000,
      name: "Foster The People",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: false
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Color.fromRGBO(242, 242, 242, 1),
                      size: 100,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'No favourites yet',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text('Make sure you have added event’s in this section')
                  ],
                ),
              )
            : FavouriteList(eventList: eventList),
      ),
    );
  }
}

class FavouriteList extends StatelessWidget {
  const FavouriteList({
    super.key,
    required this.eventList,
  });

  final List<EventModel> eventList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        const Row(
          children: [
            Text(
              'Favourites',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 4,
            ),
            CircleAvatar(
              backgroundColor: primaryColor,
              radius: 14,
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (context, index) => EventItem(
                    isFavourite: true,
                    event: eventList[index],
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailEvent(),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
