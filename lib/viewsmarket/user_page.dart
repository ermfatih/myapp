import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);
  final String profile = 'Profil';
  final double defaultCardMargin=1;


  List<ListTileItem> list = [
    ListTileItem(
      leadingHeight: 80,
      titleText: 'Fatih Mehmet Er',
      leading: const Icon(Icons.manage_accounts_sharp, size: 70),
      trailing: const Icon(null),
    ),
    ListTileItem(
      titleText: 'fatih@gmail.com',
      leading: const Icon(Icons.mail),
      trailing: const Icon(null),
    ),
    ListTileItem(
      titleText: '05511543592',
      leading: const Icon(Icons.phone_android_outlined),
      trailing: const Icon(null),
      cardMargin: 20,
    ),
    ListTileItem(
      titleText: 'adreslerim',
      leading: const Icon(Icons.map_outlined),
      //trailing: Icon(Icons.access_alarm)
    ),
    ListTileItem(
      titleText: 'adreslerim',
      leading: Icon(Icons.abc),
      //trailing: Icon(Icons.access_alarm)
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(profile)),
      body: Padding(
        padding: _ProjectPaddings.profilePageTop ,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: list[index].cardMargin ?? defaultCardMargin),
              child: SizedBox(
                height: list[index].leadingHeight,
                child: ListTile(
                  title: Text(list[index].titleText),
                  leading: list[index].leading,
                  trailing: list[index].trailing ??const Icon(Icons.navigate_next),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProjectPaddings {
  static const EdgeInsetsGeometry profilePageTop = EdgeInsets.only(top: 15);
}

class ListTileItem {
  final double? cardMargin;
  final double? leadingHeight;
  final String titleText;
  final Icon leading;
  final Icon? trailing;

  ListTileItem(
      {this.cardMargin,
      this.leadingHeight,
      required this.titleText,
      required this.leading,
      this.trailing});
}
