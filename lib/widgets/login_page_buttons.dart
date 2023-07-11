import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/pages/products_selling_page.dart';

class LoginPageButtons extends StatelessWidget {
  const LoginPageButtons({Key? key, required this.text, required this.onPressed, this.height, this.width,}) : super(key: key);

  final String text;
  final void Function() onPressed;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (height==null) ? 50:height ,
      width: (width==null) ? 250:width ,
      child: ElevatedButton(
        onPressed: onPressed ,style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ), child: Text(text,style: Theme.of(context).textTheme.headline4?.copyWith(color: ColorItems.hex
      )),),
    );
  }
}