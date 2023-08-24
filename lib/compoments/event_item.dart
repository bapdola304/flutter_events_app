import 'package:events_app/compoments/event_info.dart';
import 'package:events_app/compoments/favourites_and_share.dart';
import 'package:events_app/compoments/new_event_label.dart';
import 'package:events_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final EventModel event;
  final int? index;

  const EventItem({Key? key, required this.event, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.only(top: (index == 1) ? 16 : 0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/event_item.png',
              width: 89,
              height: 84,
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: EventInfo(
                  time: DateFormat('EEE, MMM d, · hh:mm aaa')
                      .format(DateTime.parse(event.time)),
                  name: event.name,
                  location: event.location,
                ),
              ),
            ),
            const FavouritesAndShare()
          ],
        ),
      ),
      Visibility(
        visible: (index == 1),
        child: const Positioned(
          child: NewEventLabel(name: 'New', top: 5, left: 45, paddingAll: 6),
        ),
      ),
    ]);
  }
}
