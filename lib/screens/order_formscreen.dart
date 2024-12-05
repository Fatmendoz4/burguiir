import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conia/helpers/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderFormScreen extends StatefulWidget {
  @override
  _OrderFormScreenState createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _interiorNumberController = TextEditingController();

  // Enviar el pedido a Firestore
  Future<void> _submitOrder() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          throw Exception("Usuario no autenticado");
        }

        // Crear el pedido con los datos del formulario
        await FirebaseFirestore.instance.collection('pedidos').add({
          'userId': user.uid, // Agregar el userId para asociarlo al usuario
          'name': _nameController.text,
          'lastName': _lastNameController.text,
          'phone': _phoneController.text,
          'address': _addressController.text,
          'interiorNumber': _interiorNumberController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pedido enviado exitosamente')),
        );

        // Puedes redirigir al usuario a otra pantalla después de enviar el pedido
      } catch (e) {
        print("Error enviando el pedido: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de Entrega"),
        backgroundColor: bgcolor,
      ),
      backgroundColor: bgcolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            key: _formKey,
              children: [
                Text(
              'Datos',
              style: TextStyle(
                color: active, // Rojo Burger King
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu apellido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Teléfono',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu teléfono';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Dirección de Entrega',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu dirección de entrega';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _interiorNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Número Interior',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    ),
                ),
        
                SizedBox(height: 20),
        
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: active,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: _submitOrder,
                  child: Text('Enviar Pedido',
                  style: GoogleFonts.inter(color: bgcolor),
                  ),
                ),
              ],
            
          ),
        ),
      ),
    );
  }
}
