import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/pages/products_selling_page.dart';
import 'package:myapp/viewLogin/register_page.dart';
import 'package:myapp/widgets/app_bar_text_widget.dart';
import 'package:myapp/widgets/buttom_app_bar.dart';
import 'package:myapp/widgets/login_page_buttons.dart';
import 'package:myapp/widgets/textfield_sign_in.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //buraya const eklenmiyo neden??
  final GlobalKey<FormState> _key = GlobalKey();

  final String forgotPassword = 'Şifreni mi unuttun?';
  final String hintTelNo = 'Telefon Numarası';
  final String hintPassword = 'Şifre';
  final String welcome = 'Hoşgeldiniz';
  final String signIn = 'Giriş Yap';
  final String welcomeBack = 'Welcome Back';
  final String hesabinyokmu = 'Hesabın yok mu? ';
  final String singUp = 'Kaydol';

  TextEditingController textEditingController = TextEditingController();

  void textFieldInitialValue() {
    textEditingController.text += '+90';
  }

  @override
  void initState() {
    super.initState();
    textFieldInitialValue();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
          accountInfo: hesabinyokmu,
          accountRoute: singUp,
          pageRoute: const RegisterPage()),
      appBar: AppBar(
        title: AppBarText(
          text: welcomeBack,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios_new, color: ColorItems.hex),
        ),
        elevation: 1,
        backgroundColor: ColorItems.mercury,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 20),
                child: SizedBox(
                    height: 200, child: Image.asset('asset/png/yesil.png')),
              ),
              TextFieldSignIn(
                  obscureText: false,
                  textEditingController: textEditingController,
                  textInputAction: TextInputAction.next,
                  validator: isEmpty,
                  //maxLength: 13,
                  hintText: hintTelNo,
                  textInputType: TextInputType.phone),
              TextFieldSignIn(
                  suffixIcon: true,
                  validator: isEmpty,
                  textInputAction: TextInputAction.done,
                  hintText: hintPassword,
                  obscureText: true),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: LoginPageButtons(
                  text: signIn,
                  onPressed: () {
                    if (_key.currentState?.validate() ?? false) {
                      print('valide edildi');
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: () {}, child: Text(forgotPassword)),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? isEmpty(value) {
    if (value?.toString().isEmpty ?? false) {
      return 'bu alan boş geçilemez';
      //return (value?.isEmpty ?? false) ? 'bu alan boş geçilemez' : null;
    }
    if ((value?.toString().length ?? 0) < 9) {
      return 'şifre 9 karakterden az olamaz';
    }
    return null;
  }

  Text buildText(BuildContext context) => Text(welcome,
      style: Theme.of(context)
          .textTheme
          .headline2
          ?.copyWith(color: ColorItems.hex, fontSize: 60));
}
