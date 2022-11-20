import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/mukandoprovider.dart';
import './mukando_item.dart';

class MukandoGrid extends StatelessWidget {


  MukandoGrid();

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<MukandoProvider>(context);
    final products =  productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            // builder: (c) => products[i],
            value: products[i],
            child: MukandoItem(
                // products[i].id,
                // products[i].title,
                // products[i].imageUrl,
                ),
          ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
