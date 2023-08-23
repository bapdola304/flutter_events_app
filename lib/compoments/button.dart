import 'package:events_app/constants.dart';
import 'package:flutter/material.dart';

class ButtonCommon extends StatelessWidget {
  final Function? onPress;
  final Color? color;
  final String textButton;
  final Color? textColor;
  final double? width;

  const ButtonCommon(
      {Key? key,
      required this.textButton,
      this.color = primaryColor,
      this.textColor = Colors.white,
      this.onPress,
      this.width = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0), backgroundColor: color),
          onPressed: onPress!(),
          child: Text(
            textButton,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
