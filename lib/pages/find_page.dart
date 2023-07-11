import 'package:flutter/material.dart';
import 'package:myapp/datas.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/models/product_dao.dart';
import 'package:myapp/widgets/product_list_widget.dart';
import 'package:provider/provider.dart';

class FindPage extends StatelessWidget {
  const FindPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    List<Product> a = Provider.of<ProductDao>(context).list;

    String _inputHintText = 'asad';
    return Scaffold(
      appBar: AppBar(title: const Text('Ara')),
      body: Column(
        children: [
          TextField(
              onChanged: (value) {
                Provider.of<ProductDao>(context, listen: false).getProductsByDescription(value);
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.cancel)),
                  border:
                      const OutlineInputBorder(borderRadius: BorderRadius.zero),
                  hintText: _inputHintText)),
          Expanded(
            child: ListView(
              children: [
                ProductList(products: a, controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
