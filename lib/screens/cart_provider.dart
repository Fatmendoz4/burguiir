import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conia/helpers/product_model.dart';
import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart';

class CartProvider with ChangeNotifier {
  List<MenuItem> _items = [];

  List<MenuItem> get items => _items;

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price);

  void addItem(MenuItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(MenuItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Guarda el carrito en Firestore
  Future<void> saveCartToFirestore(String uid) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception("Usuario no autenticado");
      }

      List<Map<String, dynamic>> items = _items.map((item) {
        return {
          'title': item.title,
          'description': item.description,
          'price': item.price,
          'image': item.image,
        };
      }).toList();

      // Guardamos el carrito en Firestore
      await FirebaseFirestore.instance.collection('carritos').add({
        'userId': user.uid,  // Aquí agregamos el userId para asociarlo al usuario
        'items': items,
        'totalPrice': totalPrice,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("Carrito guardado exitosamente.");
    } catch (e) {
      print("Error guardando el carrito: $e");
    }
  }
}
