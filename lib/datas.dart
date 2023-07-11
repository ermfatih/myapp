import 'package:myapp/models/category.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/pages/products_selling_page.dart';

class Datas {
  List<Category> getCategories() {
    Datas datas = Datas();
    return datas.categories;
  }

  List<Product> getProducts() {
    Datas datas = Datas();
    return datas.productItems;
  }

  List<Product> getProductsByCategoryId(int categoryId) {
    Datas datas = Datas();
    List<Product> list = [];
    for (Product a in datas.productItems) {
      if (a.categoryId == categoryId) {
        list.add(a);
      }
    }
    return list;
  }
  List<Product> getProductsByDescription(String value) {
    Datas datas = Datas();
    List<Product> list = [];
    for (Product a in datas.productItems) {
      if (a.productDescription!.contains(value)) {
        list.add(a);
      }
    }
    return list;
  }

  List<Category> categories = [
    Category(categoryId: 1, categoryName: 'Su & İçecek', imagePath: 'bat'),
    Category(categoryId: 2, categoryName: 'Meyve & Sebze', imagePath: 'bat'),
    Category(categoryId: 3, categoryName: 'Temel Gıda', imagePath: 'bat'),
    Category(categoryId: 4, categoryName: 'Atıştırmalık', imagePath: 'bat'),
    Category(categoryId: 5, categoryName: 'Dondurma', imagePath: 'bat'),
  ];
  List<Product> productItems = [
    Product(
        imagePath: 'starbucks',
        productDescription: 'su',
        id: 1,
        price: 50,
        categoryId: 1),
    Product(
        imagePath: 'starbucks',
        productDescription: 'elma',
        id: 2,
        price: 45,
        categoryId: 2),
    Product(
        imagePath: 'starbucks',
        productDescription: 'kola',
        id: 3,
        price: 50,
        categoryId: 1),
    Product(
        imagePath: 'starbucks',
        productDescription: 'prinç',
        id: 4,
        price: 70,
        categoryId: 3),
    Product(
        imagePath: 'starbucks',
        productDescription: 'kivi',
        id: 5,
        price: 35,
        categoryId: 2),
    Product(
        imagePath: 'starbucks',
        productDescription: 'un',
        id: 6,
        price: 50,
        categoryId: 3),
    Product(
        imagePath: 'starbucks',
        productDescription: 'gofret',
        id: 7,
        price: 50,
        categoryId: 4),
    Product(
        imagePath: 'starbucks',
        productDescription: 'bulgur',
        id: 8,
        price: 50,
        categoryId: 3),
    Product(
        imagePath: 'starbucks',
        productDescription: 'kek',
        id: 9,
        price: 50,
        categoryId: 4),
    Product(
        imagePath: 'starbucks',
        productDescription: 'dondurma',
        id: 10,
        price: 50,
        categoryId: 5),
  ];
}
