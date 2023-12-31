import 'package:events_app/compoments/button.dart';
import 'package:events_app/compoments/event_info.dart';
import 'package:events_app/compoments/event_item.dart';
import 'package:events_app/compoments/favourites_and_share.dart';
import 'package:events_app/compoments/loading_circle.dart';
import 'package:events_app/compoments/new_event_label.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/cubit/events_cubit.dart';
import 'package:events_app/cubit/events_state.dart';
import 'package:events_app/cubit/favourite_cubit.dart';
import 'package:events_app/events/get_location.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/favourite.dart';
import 'package:events_app/screens/detai_event.dart';
import 'package:events_app/screens/new_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _currentAddress = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<EventsCubit>().fetchPostApi();
    getLocationStatus();
  }

  Future getLocationStatus() async {
    if (await Permission.location.request().isGranted) {
      var locationAddress = await getCurrentPosition();
      debugPrint("state: $locationAddress");
      setState(() {
        _currentAddress = locationAddress;
      });
    }
  }

  Future _handleAddFavourite(EventModel event) async {
    await context.read<FavouriteCubit>().addFavourite(
        event.id, FavouriteRequest(isFavourite: !event.isFavourite!));
    context.read<EventsCubit>().fetchPostApi();
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.5;
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
                          Container(
                            width: c_width,
                            child: Text(
                              "$_currentAddress 123123218321jjj",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
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
              BlocBuilder<EventsCubit, EventsState>(
                builder: (context, state) {
                  if (state is EventsInitialLoading) {
                    return const LoadingCirle();
                  } else if (state is EventsInitialLoaded) {
                    final eventList = state.postList;
                    return Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        height: 30,
                        child: ListView.builder(
                            itemCount: eventList.length,
                            itemBuilder: (context, index) => index == 0
                                ? NewEventItem(
                                    event: eventList[index],
                                    onFavourited: () =>
                                        _handleAddFavourite(eventList[index]),
                                    onPressed: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => DetailEvent(
                                                eventId: eventList[index].id),
                                          ),
                                        ))
                                : EventItem(
                                    event: eventList[index],
                                    index: index,
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetailEvent(
                                            eventId: eventList[index].id),
                                      ),
                                    ),
                                    onFavourited: () =>
                                        _handleAddFavourite(eventList[index]),
                                  )),
                      ),
                    );
                  } else if (state is EventsError) {
                    return Text("Fail to fetch data");
                  }
                  return const SizedBox.shrink();
                },
              )
            ])),
      ),
    );
  }
}

class NewEventItem extends StatelessWidget {
  final EventModel event;
  final Function()? onPressed;
  final Function()? onFavourited;
  const NewEventItem({
    super.key,
    required this.event,
    this.onPressed,
    this.onFavourited,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Image.asset('assets/images/card_home.png'),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(children: [
                EventInfo(
                  time: DateFormat('EEE, MMM d, · hh:mm aaa')
                      .format(DateTime.parse(event.time)),
                  name: event.name,
                  location: event.location,
                ),
                FavouritesAndShare(
                    isFavourite: event.isFavourite,
                    onFavouritePressed: onFavourited)
              ]),
            )
          ],
        ),
      ),
      const NewEventLabel(
        top: 10,
        right: 10,
        name: 'New',
      )
    ]);
  }
}
