import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/mukandomodel.dart';
import '../screens/mukando_detail_screen.dart';
import '../providers/authprovider.dart';

class MukandoItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Mukando>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
           // Navigator.of(context).pushNamed(
            // MukandoDetailScreen.routeName,
            //  arguments: product.id,
           // );
          },
          child: Text(product.description)
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
             
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
