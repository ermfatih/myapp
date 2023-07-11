import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/widgets/half_button.dart';
import 'package:myapp/widgets/twice_widget.dart';
import 'package:provider/provider.dart';

class AnimatedHalfButton extends StatelessWidget {
  const AnimatedHalfButton({Key? key, required this.secondChildPadding, required this.firstChildPadding, required this.size,required this.product, this.axis=true }) : super(key: key);
  final EdgeInsetsGeometry secondChildPadding;
  final EdgeInsetsGeometry firstChildPadding;
  final double size;
  final Product product;
  final bool axis;
  @override
  Widget build(BuildContext context) {
    Function addProduct =Provider.of<Cart>(context).addProduct;
    Function incQuantity =Provider.of<Cart>(context).incQuantity;
    Function  decQuantity =Provider.of<Cart>(context).decQuantity;
    Function  removeProduct =Provider.of<Cart>(context).removeProduct;
    Function howManyInCart=Provider.of<Cart>(context).howManyInCart;
    int quantity=Provider.of<Cart>(context).howManyInCart(product);

    return AnimatedCrossFade(
        firstChild: Padding(
          padding: firstChildPadding,
          child: HalfButton(
            icon: Icons.add,
            size: size,
            onPressed: () {
              addProduct(product);
            },),
        ),
        secondChild: Padding(
          padding: secondChildPadding,
          child: TwiceWidget(axis: axis,text:howManyInCart(product).toString(),onPressedA: () {
            incQuantity(product);
          },onPressedD: () {
            decQuantity(product);
            if(quantity==1){
              removeProduct(product);
            }
          },size:size ),
        ),
        crossFadeState: (quantity>0)?  CrossFadeState.showSecond  : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 1));
  }
}