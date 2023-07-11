import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/project_paddings.dart';
import 'package:myapp/widgets/animated_half_button.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    List list =Provider.of<Cart>(context).cart;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
            (list.isNotEmpty)?
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const CartPage(),));
            }, icon:const Icon(Icons.shopping_cart)):const SizedBox.shrink()
        ],
          title: Text(product.productDescription ?? ''),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.cancel))),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Card(
                child: SizedBox(
                  width: width / 1.5,
                  height: height / 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: height / 2.5,
                        child:
                            Image.asset('asset/png/${product.imagePath}.png'),
                      ),
                      SizedBox(
                        width: 200,
                        child: Center(
                            child: Text(('${product.productDescription}'),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 20))),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: Center(
                          child: Text('₺${product.price.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                    color: ColorItems.hex,
                                  )),
                        ),

                        //FloatingActionButton(onPressed: () {}, child:const Icon(Icons.add),)
                      )
                    ],
                  ),
                ),
              ),
            ),
            AnimatedHalfButton(
              product: product,
              size: 60,
                secondChildPadding: ProjectPaddings.halfButtonProductDetailPadding,
                firstChildPadding:
                    ProjectPaddings.halfButtonProductDetailPadding),
          ],
        ),
      ),
    );
  }
}
