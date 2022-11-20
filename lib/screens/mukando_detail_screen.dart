import 'package:flutter/material.dart';
import 'package:pfumamugaba/screens/initiate.dart';

class MukandoDetail extends StatelessWidget {
  const MukandoDetail({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mukando Detail")),
      body: ListView(
        children:  <Widget>[
         const Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Mukando 1'),
              subtitle: Text('Name'),
            ),
          ),
         const Card(
            child: ListTile(
                leading: Icon(Icons.monetization_on),
              title: Text('Grocery Mukando end of year'),
              subtitle: Text('description'),
            ),
          ),
        const  Card(
            child: ListTile(
                leading: Icon(Icons.monetization_on),
              title: Text('\$10 000'),
              subtitle: Text('target'),
            ),
          ),
           ElevatedButton(
             onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  InitiatePayment()),
                    );
             },
              child:const Text("Pay now")),
        ],
      ),);
  }
}