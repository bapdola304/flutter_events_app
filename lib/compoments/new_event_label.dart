import 'package:events_app/constants.dart';
import 'package:flutter/material.dart';

class NewEventLabel extends StatelessWidget {
  final String name;
  final double? top;
  final double? right;
  final double? left;
  final double? paddingAll;

  const NewEventLabel(
      {Key? key,
      required this.name,
      this.top,
      this.right,
      this.left,
      this.paddingAll = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      left: left,
      child: Container(
        padding: EdgeInsets.all(paddingAll!),
        decoration: BoxDecoration(
            color: greenColor, borderRadius: BorderRadius.circular(5)),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
