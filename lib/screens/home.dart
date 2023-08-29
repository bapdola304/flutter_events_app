import 'package:events_app/compoments/button.dart';
import 'package:events_app/compoments/event_info.dart';
import 'package:events_app/compoments/event_item.dart';
import 'package:events_app/compoments/favourites_and_share.dart';
import 'package:events_app/compoments/new_event_label.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/events/get_location.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/screens/detai_event.dart';
import 'package:events_app/screens/new_event.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum PermissionGroup {
  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - Always
  locationAlways,

  /// Android: Fine and Coarse Location
  /// iOS: CoreLocation - WhenInUse
  locationWhenInUse
}

class _HomeState extends State<Home> {
  String _currentAddress = "";

  List<EventModel> eventList = [
    const EventModel(
      id: 1,
      price: 10000,
      name: "Music concert",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Quy Nhon',
    ),
    const EventModel(
      id: 2,
      price: 20000,
      name: "Football",
      image: "https://picsum.photos/200",
      time: '2023-09-25T03:23:08.073Z',
      location: 'Quy Nhon',
    ),
    const EventModel(
      id: 3,
      price: 30000,
      name: "Black Pink",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    ),
    const EventModel(
      id: 4,
      price: 30000,
      name: "The Wombats",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    ),
    const EventModel(
      id: 5,
      price: 30000,
      name: "Foster The People",
      image: "https://picsum.photos/200",
      time: '2023-08-25T03:23:08.073Z',
      location: 'Hà nội',
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationStatus();
  }

  Future getLocationStatus() async {
    if (await Permission.location.request().isGranted) {
      var locationAddress = await getCurrentPosition();
      setState(() {
        _currentAddress = locationAddress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Find events in',
                        style: TextStyle(color: grayText, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(width: 4),
                          Text(
                            _currentAddress,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  ButtonCommon(
                    textButton: 'New Event',
                    width: 120,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NewEvent(),
                        ),
                      );
                    },
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Popular in $_currentAddress',
                    style: const TextStyle(fontSize: 16),
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  height: 30,
                  child: ListView.builder(
                      itemCount: eventList.length,
                      itemBuilder: (context, index) => index == 0
                          ? const NewEventItem()
                          : EventItem(
                              event: eventList[index],
                              index: index,
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DetailEvent(),
                                ),
                              ),
                            )),
                ),
              )
            ])),
      ),
    );
  }
}

class NewEventItem extends StatelessWidget {
  const NewEventItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Image.asset('assets/images/card_home.png'),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: const Column(children: [
              EventInfo(
                time: 'Mon, Apr 18 · 21:00 Pm ',
                name: 'La Rosalia',
                location: 'Palau Sant Jordi, Barcelona',
              ),
              FavouritesAndShare()
            ]),
          )
        ],
      ),
      const NewEventLabel(
        top: 10,
        right: 10,
        name: 'New',
      )
    ]);
  }
}
