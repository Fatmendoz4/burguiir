import 'package:conia/helpers/style.dart';
import 'package:conia/screens/order_formscreen.dart';
import 'package:conia/screens/cart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
 // Importa donde tengas el modelo MenuItem y los productos

class CartPage extends StatelessWidget {

  void checkAndOrder(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    await cart.saveCartToFirestore(user.uid);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderFormScreen()),
    );
  } else {
    Navigator.pushNamed(context, '/login');
  }
}


  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
        backgroundColor: bgcolor,
      ),
      backgroundColor: bgcolor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          width: 500,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return ListTile(
                      leading: Image.asset(item.image, width: 50, height: 50),
                      title: Text(item.title),
                      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          cart.removeItem(item);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style:  ElevatedButton.styleFrom(
             backgroundColor: active,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              textStyle: TextStyle(fontSize: 16),
            ),
            onPressed: () => checkAndOrder(context),
            child: Text("Generar Orden", style: GoogleFonts.inter(color: bgcolor),),
          )
          
            ],
          ),
        ),
      ),
    );
  }
}
