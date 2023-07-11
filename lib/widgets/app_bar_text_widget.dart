import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    Key? key, this.text,
  }) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',style: Theme.of(context).textTheme.subtitle1?.copyWith(
      fontWeight: FontWeight.bold,
      //fontSize: 18
    ),);
  }
}