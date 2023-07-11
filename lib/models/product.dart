import 'category.dart';

class Product{
  final int id;
  final String? imagePath;
  final String? productDescription;
  final double price;
  final int categoryId;


  Product({required this.id,required this.price,this.imagePath, this.productDescription, required this.categoryId});

}