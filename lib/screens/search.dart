import 'package:events_app/compoments/event_item.dart';
import 'package:events_app/constants.dart';
import 'package:events_app/models/event.dart';
import 'package:events_app/screens/detai_event.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['A-Z', 'Z-A', 'Date'];

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              const SearchBox(),
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  height: 30,
                  child: ListView.builder(
                      itemCount: eventList.length,
                      itemBuilder: (context, index) => EventItem(
                            event: eventList[index],
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DetailEvent(),
                              ),
                            ),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: const TextField(
          style: TextStyle(color: textColor, fontSize: 16),
          decoration: InputDecoration(
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
