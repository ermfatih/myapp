import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/pages/product_detail_page.dart';
import 'package:myapp/project_paddings.dart';
import 'package:myapp/widgets/animated_half_button.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, this.controller, required this.products,}) : super(key: key);

  final ScrollController? controller;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.screenPadding,
      child:Column(
          children: [
            GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              controller: controller,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {

                return Stack(
                  children: [
                    Padding(
                      padding:ProjectPaddings.gridProductHalfButtonPadding ,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: products[index],),));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 100,
                                child: Image.asset(
                                    'asset/png/${products[index].imagePath}.png'),
                              ),
                              Text((products[index].productDescription ??
                                  '')),
                              Container(
                                color: ColorItems.transparent,
                                width: 200,
                                height: 50,
                                child: Center(
                                  child: Text('₺${products[index].price.toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                        color: ColorItems.hex,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedHalfButton(product: products[index],size: 50,secondChildPadding:const EdgeInsets.only(left: 150),firstChildPadding:const EdgeInsets.only(left: 150),)
                  ],
                );
              },
            ),
          ],
        ),

    );
  }
}
