import 'package:conia/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromotionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width < 600; // Verificación para dispositivos móviles

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "PROMOCIONES",
            style: GoogleFonts.inter(
              fontSize: 55,
              fontWeight: FontWeight.bold,
              color: active,
            ),
          ),
          const SizedBox(height: 60), // Espacio entre título y tarjetas
          _buildGrid(isMobile),
          SizedBox(height: 70),
        ],
      ),
    );
  }

  // Construimos un GridView o Wrap para las tarjetas de promoción
  Widget _buildGrid(bool isMobile) {
    return isMobile
        ? Wrap(
            spacing: 10, // Espaciado horizontal
            runSpacing: 10, // Espaciado vertical
            alignment: WrapAlignment.center,
            children: _buildCards(),
          )
        : GridView.count(
            shrinkWrap: true, // Evitar que GridView tome espacio infinito
            crossAxisCount: 3, // Tres tarjetas por fila en pantallas grandes
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
            children: _buildCards(),
          );
  }

  // Lista de Tarjetas de Promoción
  List<Widget> _buildCards() {
    // Lista de imágenes para las tarjetas
    final List<String> imagePaths = [
      'assets/PROMO1.png',
      'assets/PROMO2.png',
      'assets/PROMO3.png',
    ];

    // Generar las tarjetas con imágenes únicas
    return List.generate(3, (index) {
      return Container(
        decoration: BoxDecoration(
          color: active,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePaths[index], // Imagen correspondiente al índice
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
    });
  }
}

