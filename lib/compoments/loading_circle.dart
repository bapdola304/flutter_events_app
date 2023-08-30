import 'package:flutter/material.dart';

class LoadingCirle extends StatelessWidget {
  const LoadingCirle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
