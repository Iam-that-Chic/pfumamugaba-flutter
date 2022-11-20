import 'package:flutter/material.dart';
import 'package:pfumamugaba/screens/mukando_detail_screen.dart';

class MyMukando extends StatelessWidget {
  const MyMukando({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Mukando")),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                //  leading: const Icon(Icons.list),
                  trailing: const Text(
                    "View",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("Mukando $index "),
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MukandoDetail()),
                    );
                    },
                  ),
                  
            );
          }),
    );
  }
}