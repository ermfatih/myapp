import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/pages/products_selling_page.dart';
import 'package:myapp/project_paddings.dart';

class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({Key? key, required this.icon}) : super(key: key);
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.appBarPadding,
      child: Card(
          color: ColorItems.transparent,
          child: IconButton(onPressed: () {}, icon: icon)),
    );
  }
}