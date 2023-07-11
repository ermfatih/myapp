import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';

class HalfButton extends StatelessWidget {
  const HalfButton({Key? key, this.onPressed, this.size=50, required this.icon,}) : super(key: key);
  final Function()? onPressed;
  final double size;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size,
        width: size,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Icon(icon,
              color: ColorItems.hex,
            )));
  }
}
