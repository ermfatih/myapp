import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/product_dao.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/project_paddings.dart';
import 'package:myapp/datas.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/widgets/product_list_widget.dart';
import 'package:provider/provider.dart';

class ProductSellingPage extends StatefulWidget {
  const ProductSellingPage({Key? key}) : super(key: key);

  @override
  State<ProductSellingPage> createState() => _ProductSellingPageState();
}

class _ProductSellingPageState extends State<ProductSellingPage> {
  late TextEditingController textEditingController;
  late ScrollController controller;
  late List<Category> categories;
  late List<Product> products;

  void getProducts() {
    products = Datas().getProducts();
  }

  void getProductsByCategoryId(int categoryId) {
    products = Datas().getProductsByCategoryId(categoryId);
  }

  void getCategories() {
    categories = Datas().getCategories();
  }

  final String _title = 'GoloMarket';
  final String _inputHintText = ' Search all products';
  final String _onlineDelivery = 'Online Delivery';
  void findProductsByDescription2(value) {
    Datas datas = Datas();
    products = datas.getProductsByDescription(value);
  }

  @override
  void initState() {
    controller = ScrollController();
    textEditingController = TextEditingController();
    //getProducts();
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    List list = Provider.of<Cart>(context).cart;
    return Scaffold(
      //drawer: buildDrawer(),
      appBar: AppBar(
        elevation: 0,
          actions: [
            (list.isNotEmpty)
                ? IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
                },
                icon: const Icon(Icons.shopping_cart))
                : const SizedBox.shrink(),
          ],
          title: Text(
            _title,
            style: GoogleFonts.msMadi(fontSize: 35,),
          )),
      body: Column(
        children: [
          _buildCategoriesList(width,height*.3),
          Expanded(
            child: ListView(
              children: [
                ProductList(controller: controller, products: products,),
              ],
            ),
          ),
        ],
      ),

      );
  }

  Drawer buildDrawer() {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: ColorItems.hex),
          accountName: Text('Fatih Mehmet Er'),
          accountEmail: Text('fatiher1227@gmail.com'),
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
        ),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
            label: const Text('Profil'))
      ],
    ));
  }

  Widget buildSearchTextField() {
    return TextField(
        onChanged: (value) {
          setState(() {
            findProductsByDescription2(value);
          });
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
            hintText: _inputHintText));
  }
  Widget _buildCategoriesList(double width,double height) {
    products=Provider.of<ProductDao>(context).getProductsList;
    Function getProductsByCategoryId=Provider.of<ProductDao>(context).getProductsByCategoryId;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: width,
          color: ColorItems.hex,
          height: height/3.5,
        ),
        SizedBox(
          height: height/4,
          width: width - 7,
          child: Padding(
            padding:const EdgeInsets.only(top: 0,left: 0,bottom: 0,right: 5),
            child: ListView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 0,left: 5,bottom: 0,right: 5),
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            onPrimary: ColorItems.hex,
                          ),
                          onPressed: () {
                            getProductsByCategoryId(categories[index].categoryId);
                          },
                          child: Text(categories[index].categoryName,
                              style: const TextStyle(color: ColorItems.black))));
                },
                itemCount: categories.length,
                scrollDirection: Axis.horizontal),
          ),
        ),
      ],
    );
  }
}

extension StringExts on String {
  String toLowerCaseTr() {
    return replaceAll('I', 'ı').replaceAll('İ', 'i').toLowerCase();
  }
}
