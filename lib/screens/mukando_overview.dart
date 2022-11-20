import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/mukandoprovider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/mukando_grid.dart';


class MukandoOverviewScreen extends StatefulWidget {
  @override
  _MukandoOverviewScreenState createState() => _MukandoOverviewScreenState();
}

class _MukandoOverviewScreenState extends State<MukandoOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<MukandoProvider>(context).fetchAndSetMukando().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pfumamugaba'),
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ?const Center(
              child:  CircularProgressIndicator(),
            )
          : MukandoGrid(),
    );
  }
}
