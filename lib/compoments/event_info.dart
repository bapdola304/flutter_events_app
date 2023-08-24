import 'package:events_app/constants.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatelessWidget {
  final String time;
  final String name;
  final String location;

  const EventInfo(
      {Key? key,
      required this.time,
      required this.name,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(time),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, color: textColor),
            const SizedBox(width: 4),
            Text(
              location,
              style: const TextStyle(color: textColor, fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}
