import 'package:flutter/material.dart';
import 'package:myapp/color_items.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/widgets/animated_half_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Tuple> cart = Provider.of<Cart>(context).cart;
    Function deleteAll = Provider.of<Cart>(context).clearCart;
    return Scaffold(
        //  bottomNavigationBar: _buildBottomAppBar(cart),
        appBar: buildAppBar(context, deleteAll),
        body: (cart.isNotEmpty)
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 100,
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: ListTile(
                                subtitle:
                                    Text('${cart[index].product.price} tl'),
                                trailing: SizedBox(
                                    width: 150,
                                    height: 40,
                                    child: AnimatedHalfButton(
                                        axis: false,
                                        secondChildPadding:
                                            const EdgeInsets.only(right: 0),
                                        firstChildPadding:
                                            const EdgeInsets.only(right: 0),
                                        size: 50,
                                        product: cart[index].product)),
                                title: Text(
                                    cart[index].product.productDescription ??
                                        ''),
                                leading: Card(
                                    color: Colors.white,
                                    elevation: 1,
                                    child: Container(
                                        margin: const EdgeInsets.all(5),
                                        child:
                                            Image.asset('asset/png/bat.png'))),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Builder(
                    builder: (context) {double sum = 0;for (var element in cart) {sum += (element.quantity * element.product.price);}
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(width: width,height: height/8,color: Colors.white),
                          SizedBox(
                            width: width*0.9,
                            height: height/12,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                primary: ColorItems.hex,
                                  onPrimary: ColorItems.hex,
                                  visualDensity: VisualDensity.standard),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: width/8),
                                    child: Text('Devam',style: TextStyle(color: Colors.black,fontSize: 25),),
                                  ),
                                  Container(height: height/15,width: width/3,child: Center(child: Text('tl '+sum.toString() )),color: Colors.white,)
                                ],
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                  )
                ],
              )
            :const Center(child: Text('Sepetiniz boş ')));
  }
  AppBar buildAppBar(BuildContext context, Function deleteAll) {
    List list = Provider.of<Cart>(context).cart;
    return AppBar(
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      },icon: Icon(Icons.cancel,)),
        title: const Text('Sepetim'), actions: [
      (list.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.only(right: 13),
              child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.zero,
                          content: Text(
                              'Sepetinizi boşaltmak istediğinize emin misiniz?',
                              textAlign: TextAlign.center),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  deleteAll();
                                  Navigator.pop(context);
                                  //Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                child: Text('Evet')),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                child: Text('Hayır'))
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete)),
            )
          : const SizedBox.shrink(),
    ]);
  }
}

