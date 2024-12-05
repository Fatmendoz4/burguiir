import 'package:conia/helpers/product_model.dart';
import 'package:conia/helpers/style.dart';
import 'package:conia/screens/cart_page.dart';
import 'package:conia/screens/cart_provider.dart';
import 'package:conia/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ProductDetailScreen extends StatelessWidget {
  final MenuItem item;

  const ProductDetailScreen({Key? key, required this.item}) : super(key: key);

void realizarPedido(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    // Usuario no autenticado: redirigir a login
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  } else {
    // Usuario autenticado: agregar el producto al carrito
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(item); // Agrega el producto al carrito

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Producto añadido al carrito")),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: bgcolor,
      ),
      backgroundColor: bgcolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.brown,
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  item.image,
                  width: 400,
                  
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                item.title,
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.description,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.brown[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: active,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => realizarPedido(context),
                child: Text(
                        "Agregar al carrito",
                        style: TextStyle(color: bgcolor),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: active,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                icon: Icon(Icons.shopping_cart, color: bgcolor,), 
                label: Text('Ver carrito',
                style: TextStyle(color: Color.fromARGB(255, 254, 216, 186)),
                ),
                style: TextButton.styleFrom(
                        backgroundColor: active,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
