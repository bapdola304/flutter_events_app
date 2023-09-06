import 'package:events_app/constants.dart';
import 'package:flutter/material.dart';

class ButtonCommon extends StatelessWidget {
  final Function()? onPress;
  final Color? color;
  final String textButton;
  final Color? textColor;
  final double? width;
  final double? padding;
  final bool? isLoading;

  const ButtonCommon(
      {Key? key,
      required this.textButton,
      this.color = primaryColor,
      this.textColor = Colors.white,
      required this.onPress,
      this.padding = 12,
      this.width = 120,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(padding!), backgroundColor: color),
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textButton,
                style: TextStyle(color: textColor),
              ),
              const SizedBox(
                width: 8,
              ),
              isLoading == true
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
