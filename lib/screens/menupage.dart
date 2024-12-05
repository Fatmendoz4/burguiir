import 'package:conia/helpers/product_model.dart';
import 'package:conia/helpers/style.dart';
import 'package:conia/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    // Cambia la cantidad de columnas según el tamaño de la pantalla
    int crossAxisCount = screenSize.width > 800 ? 3 : 1; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        backgroundColor: bgcolor,
      ),
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título del Menú
            Text(
              "MENÚ",
              style: GoogleFonts.inter(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: active,
              ),
            ),
            const SizedBox(height: 40),

            // GridView que contiene las tarjetas de los productos
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Columnas dinámicas
                  crossAxisSpacing: 50, // Espacio horizontal
                  mainAxisSpacing: 30, // Espacio vertical
                  childAspectRatio: 5 / 3, // Relación de aspecto de las tarjetas
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return MenuItemCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Lista de productos
final List<MenuItem> menuItems = [
  MenuItem(
    title: "SMASH BURGUER",
    description: "Hamburguesa con doble carne, queso, tocino, cebolla caramelizada y aderezo a elegir.",
    image: 'assets/smash.png',
    price: 50,
  ),
  MenuItem(
    title: "HAWAIANA",
    description: "Hamburguesa con carne, piña, cebolla caramelizada, queso.",
    image: 'assets/hawaiana.png', 
    price: 65,
  ),
  MenuItem(
    title: "BONELESS BURGUER",
    description: "Con queso amarillo, ranch y lechuga.",
    image: 'assets/burgiir-burgiir-logo.png', price: 70,
  ),
  MenuItem(
    title: "DOGOS",
    description: "Hot dog con doble salchicha, tocino, queso y aderezo a elegir.",
    image: 'assets/dogos.png', price: 30,
  ),
  MenuItem(
    title: "SALCHI-PAPAS",
    description: "Descripción sobre la hamburguesa.",
    image: 'assets/salchipapas.png', 
    price: 40,
  ),
  MenuItem(
    title: "PAPAS FRITAS",
    description: "Descripción sobre la hamburguesa.",
    image: 'assets/papasfritas.png', 
    price: 30,
  ),
];

// Widget para cada tarjeta del menú
class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: tarjeta,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              item.image,
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: letras,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: letras,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                   const SizedBox(height: 8),
                  // Mostrar el precio aquí
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: active,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(item: item),
                          ),
                        );
                      },
                      child: const Text(
                        "Pedir Ahora >",
                        style: TextStyle(color: Color.fromARGB(255, 254, 216, 186)),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: active,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
