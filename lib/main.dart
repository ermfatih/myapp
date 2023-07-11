import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/product_dao.dart';
import 'package:myapp/pages/tabbar_page.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/viewLogin/login_or_register_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Cart>(create: (context) => Cart(),),
      ChangeNotifierProvider<ProductDao>(create: (context) => ProductDao(),)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      home: const TabBarPage(),
    );
  }
}
