import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/viewLogin/login_or_register_page.dart';


class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key, this.accountInfo, this.accountRoute,  this.pageRoute,
  }) : super(key: key);
  final String? accountInfo;
  final String? accountRoute;
  final Widget? pageRoute;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        height: 50,
        color: ColorItems.mercury,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(accountInfo ?? ''),
              InkWell(onTap:() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => pageRoute ?? const LoginOrRegisterPage()));
              },child: Text(accountRoute ?? '',style: const TextStyle(decoration: TextDecoration.underline),)),
            ],
          ),
        ),
      ),
    );
  }
}
