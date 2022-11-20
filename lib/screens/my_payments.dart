import 'package:flutter/material.dart';

class MyPayments extends StatelessWidget {
  const MyPayments({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Payments")),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Paid \$50'),
              subtitle: Text('12-09-2022'),
            ),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.monetization_on),
              title: Text('Paid \$70'),
              subtitle: Text('22-10-2022'),
            ),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.monetization_on),
              title: Text('Paid \$50'),
              subtitle: Text('12-11-2022'),
            ),
          ),
        ],
      ),);
  }
}