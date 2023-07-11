import 'package:flutter/material.dart';
import 'package:myapp/datas.dart';
import 'package:myapp/models/product.dart';

class ProductDao extends ChangeNotifier{
  List<Product> list=[];
  List<Product> getProductsList=[];
  void getProductsByDescription(String value) {
    List<Product> liste=[];
    Datas datas = Datas();
    if(value!=''){
      for (Product a in datas.productItems) {
        if (a.productDescription!.contains(value)) {
          liste.add(a);
          notifyListeners();
        }
      }
    }
    list=liste;
    notifyListeners();
  }

  void getProductsByCategoryId(int categoryId) {
    Datas datas = Datas();
    List<Product> list = [];
    for (Product a in datas.productItems) {
      if (a.categoryId == categoryId) {
        list.add(a);
        notifyListeners();
      }
    }
    getProductsList=list;
    notifyListeners();
  }
}