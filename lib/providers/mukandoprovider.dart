import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../models/mukandomodel.dart';

class MukandoProvider with ChangeNotifier {
  List<Mukando> _items = [
  ];
  // var _showFavoritesOnly = false;
  final String authToken;
  final String userId;

  MukandoProvider(this.authToken, this.userId, this._items);

  List<Mukando> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

 
  Mukando findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }



  Future<void> fetchAndSetMukando([bool filterByUser = false]) async {
    final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url =
       Uri.parse( 'https://127.0.0.1:8001');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return;
      }
    final List<Mukando> loadedMukando = [];
      extractedData.forEach((prodId, prodData) {
        loadedMukando.add(Mukando(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          target: prodData['price'],
          enddate: prodData['imageUrl'],
        ));
      });
      _items = loadedMukando;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Mukando product) async {
    final url =
       Uri.parse( 'https://127.0.0.1:8001');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'target': product.target,
          'enddate': product.enddate,
          'creatorId': userId,
        }),
      );
      final newProduct = Mukando(
        title: product.title,
        description: product.description,
        target: product.target,
        enddate: product.enddate,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Mukando newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse( 'https://127.0.0.1:8001');
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'target': newProduct.target,
            'enddate': newProduct.enddate
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
       Uri.parse( 'https://127.0.0.1:8001');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    Mukando? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
