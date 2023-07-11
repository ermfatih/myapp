import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/pages/products_selling_page.dart';
import 'package:myapp/viewLogin/login_page.dart';
import 'package:myapp/viewLogin/register_page.dart';
import 'package:myapp/widgets/buttom_app_bar.dart';
import 'package:myapp/widgets/login_page_buttons.dart';

class LoginOrRegisterPage extends StatelessWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);
  final String login='Giriş';
  final String register='Kayıt Ol';
  @override
  Widget build(BuildContext context) {
    double screenSize= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(

          backgroundColor: ColorItems.mercury,elevation: 0),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
              Image.asset('asset/png/yesil.png',height: screenSize/2),
              Container(height: 40,),
              LoginPageButtons(text: login,onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const LogInPage(),));
              },),
              Container(height: 40,),
              LoginPageButtons(text: register,onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const RegisterPage(),));
              },),
              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}




