import 'package:flutter/material.dart';

class PageR extends ChangeNotifier{
  int selectedPage=0;
  void productSelling(){
    selectedPage=1;
    notifyListeners();
  }
  void backPage(){
    selectedPage=0;
    notifyListeners();
  }


}