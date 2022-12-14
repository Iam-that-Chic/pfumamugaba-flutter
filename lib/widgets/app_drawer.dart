import 'package:flutter/material.dart';
import 'package:pfumamugaba/screens/my_mukando.dart';
import 'package:pfumamugaba/screens/my_payments.dart';
import 'package:provider/provider.dart';

import '../providers/authprovider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title:const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title:const Text('My Mukando'),
            onTap: () {
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyMukando()),
            );
            },
          ),
         const Divider(),
          ListTile(
            leading:const Icon(Icons.payment),
            title:const Text('My Payments'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyPayments()),
            );
            },
          ),
         const Divider(),
          ListTile(
            leading:const Icon(Icons.star),
            title:const Text('Loyalty Points'),
            onTap: () {
              
            },
          ),
         const Divider(),
          ListTile(
            leading:const Icon(Icons.exit_to_app),
            title:const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
