import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/widgets/half_button.dart';
import 'package:provider/provider.dart';

class TwiceWidget extends StatelessWidget {
  const TwiceWidget({Key? key, this.size=50,required this.onPressedA,required this.onPressedD, required this.text,this.axis=true }) : super(key: key);
  final bool axis;
  final double size;
  final Function() onPressedA;
  final Function() onPressedD;
  final String text;
  @override
  Widget build(BuildContext context) {


    return axis?Column(
      children: [
        HalfButton(onPressed: onPressedA,size: size,icon: Icons.text_increase),
        Container(color: ColorItems.hex, width: size, height: size,child: Center(child: Text(text,style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),)),),
        HalfButton(onPressed: onPressedD,size:size,icon: Icons.text_decrease),
      ],
    ):Row(
      children: [
        HalfButton(onPressed: onPressedA,size: size,icon: Icons.text_increase),
        Container(color: ColorItems.hex, width: size, height: size,child: Center(child: Text(text,style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),)),),
        HalfButton(onPressed: onPressedD,size:size,icon: Icons.text_decrease),
      ],
    ) ;
  }
}