import 'package:events_app/compoments/event_info.dart';
import 'package:events_app/compoments/favourites_and_share.dart';
import 'package:events_app/compoments/new_event_label.dart';
import 'package:events_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final EventModel event;
  final int? index;
  final bool? isFavourite;
  final Function()? onPressed;
  final Function()? onFavourited;

  const EventItem(
      {Key? key,
      required this.event,
      this.index,
      this.onPressed,
      this.isFavourite,
      this.onFavourited})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isURLValid = Uri.parse(event.image).host.isNotEmpty;

    return Stack(children: [
      Container(
        padding: EdgeInsets.only(top: (index == 1) ? 16 : 0),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: InkWell(
                onTap: onPressed,
                child: Row(
                  children: [
                    isURLValid
                        ? Image.network(
                            event.image,
                            width: 89,
                            height: 84,
                          )
                        : Image.asset(
                            "assets/images/detail.png",
                            width: 89,
                            height: 84,
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: EventInfo(
                        time: DateFormat('EEE, MMM d, · hh:mm aaa')
                            .format(DateTime.parse(event.time)),
                        name: event.name,
                        location: event.location,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FavouritesAndShare(
                isFavourite: event.isFavourite,
                onFavouritePressed: onFavourited)
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
