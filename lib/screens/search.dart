import 'package:events_app/compoments/event_item.dart';
import 'package:events_app/compoments/loading_circle.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/cubit/events_cubit.dart';
import 'package:events_app/cubit/events_state.dart';
import 'package:events_app/cubit/favourite_cubit.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/models/favourite.dart';
import 'package:events_app/screens/detai_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<String> list = <String>['A-Z', 'Z-A', 'Date'];

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var eventList = <EventModel>[];

  List<EventModel> eventListData = [
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

  Future _handleAddFavourite(EventModel event) async {
    await context.read<FavouriteCubit>().addFavourite(
        event.id, FavouriteRequest(isFavourite: !event.isFavourite!));
    context.read<EventsCubit>().fetchPostApi();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData(eventListData);
  }

  void setData(List<EventModel> data) {
    setState(() {
      eventList = data;
    });
  }

  void filterSearchResults(String query) {
    setState(() {
      eventList = eventListData
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              SearchBox(
                onChanged: (value) {
                  filterSearchResults(value);
                },
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '537 Events',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  DropdownSort()
                ],
              ),
              BlocBuilder<EventsCubit, EventsState>(
                builder: (context, state) {
                  if (state is EventsInitialLoading) {
                    return const LoadingCirle();
                  } else if (state is EventsInitialLoaded) {
                    // setData(state.postList);
                    return Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          height: 30,
                          child: ListView.builder(
                              itemCount: eventList.length,
                              itemBuilder: (context, index) => EventItem(
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
                                  ))),
                    );
                  } else if (state is EventsError) {
                    return Text("Fail to fetch data");
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final Function(String value)? onChanged;
  const SearchBox({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
          onChanged: (String value) {
            onChanged!(value);
          },
          style: const TextStyle(color: textColor, fontSize: 16),
          decoration: const InputDecoration(
            // icon: Icon(Icons.search),
            hintText: 'Search for...',
            hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
          )),
    );
  }
}

class DropdownSort extends StatefulWidget {
  const DropdownSort({super.key});

  @override
  State<DropdownSort> createState() => _DropdownSortState();
}

class _DropdownSortState extends State<DropdownSort> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_sharp),
      elevation: 16,
      style: const TextStyle(color: textColor),
      underline: SizedBox(),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
