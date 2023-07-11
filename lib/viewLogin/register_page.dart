import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/pages/products_selling_page.dart';
import 'package:myapp/viewLogin/login_page.dart';
import 'package:myapp/widgets/app_bar_text_widget.dart';
import 'package:myapp/widgets/buttom_app_bar.dart';
import 'package:myapp/widgets/login_page_buttons.dart';
import 'package:myapp/widgets/textfield_sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController passwordController = TextEditingController();
  final String signUp = 'Sign Up';

  final String alreadyAccount = 'Zaten hesabınız var mı?';

  final String signIn = ' Giriş Yapınız';

  final String createYourAccount = 'Create Your Account';

  final String pleaseEnterInfo = 'Please enter info to create account';

  final String hintFirstName = 'First Name';

  final String hintLastName = 'Last Name';

  final String hintEmail = 'Email';

  final String hintPhone = 'Phone';

  final String kayitOl = 'Kayıt Ol';
  final String password='Şifre';
  final String passwordAgain='Şifre Tekrar';

  final GlobalKey<FormState> _key = GlobalKey();

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: ColorItems.hex),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: AppBarText(text: signUp),
        elevation: 1,
        backgroundColor: ColorItems.mercury,
      ),
      bottomNavigationBar: CustomBottomAppBar(
          accountInfo: alreadyAccount,
          accountRoute: signIn,
          pageRoute: const LogInPage()),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: autoValidate,
          key: _key,
          child: Column(
            children: [
              //Image.asset('asset/png/yesil.png',height: 50),
              Container(height: 30),
              Text(
                createYourAccount,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 30),
              ),
              Text(
                pleaseEnterInfo,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: 15),
              ),
              Container(height: 15),
              TextFieldSignIn(
                  validator: isEmpty,
                  prefixIcon: const Icon(Icons.person),
                  hintText: hintFirstName),
              TextFieldSignIn(
                  validator: isEmpty,
                  prefixIcon: const Icon(Icons.person),
                  hintText: hintLastName),
              TextFieldSignIn(
                validator: isEmpty,
                prefixIcon:const Icon(Icons.phone),
                hintText: hintPhone,
              ),
              TextFieldSignIn(
                  validator: mailValidate,
                  prefixIcon: const Icon(Icons.email),
                  hintText: hintEmail),
              TextFieldSignIn(
                suffixIcon: true,
                obscureText: true,
                textEditingController: passwordController,
                validator: passwordValidate,
                prefixIcon:const Icon(Icons.phone), hintText: password,
              ),
              TextFieldSignIn(
                  textInputAction: TextInputAction.done,
                  suffixIcon: true,
                  obscureText: true,
                  validator: passwordControlValidate,
                  prefixIcon: const Icon(Icons.phone),
                  hintText: passwordAgain),
              Container(height: 20),
              LoginPageButtons(
                text: kayitOl,
                onPressed: loginPageButtonOnPressed,
              ),
              Container(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void loginPageButtonOnPressed() {
    if ((_key.currentState?.validate() ?? false)) {
      return print('valide edildi');
    } else {
      setState(() {
        autoValidate = AutovalidateMode.always;
      });
    }
  }

  String? passwordControlValidate(value) {
    if (value?.toString().isEmpty ?? false){
      return 'bu alan boş geçilemez';
    }
    return passwordController.text != value ? 'şifreler aynı olmalı' : null;
  }

  String? passwordValidate(value) {
    if (value?.toString().isEmpty ?? false) {
      return 'bu alan boş geçilemez';
    }
    return (value.toString().length > 5)
        ? null
        : 'şifre en az 6 karakter olmalı';
  }

  String? mailValidate(value) {
    if (value?.toString().isEmpty ?? false) {
      return 'bu alan boş geçilemez';
    }
    //return value.toString().contains(RegExp(r'[a,z]')) ? null:'';
    return (value?.toString().contains('@') ?? false)
        ? null
        : 'lütfen mail formatında giriniz ornek@gmail.com';
  }

  String? isEmpty(value) {
    //String validet=value?.toString().;

    if (value?.toString().isEmpty ?? false) {
      return 'bu alan boş geçilemez';
    }
    return null;
  }
}
