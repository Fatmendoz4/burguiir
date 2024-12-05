import 'package:conia/helpers/style.dart';
import 'package:conia/screens/modelado.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    // Verificamos si la pantalla es pequeña (mobile)
    bool isMobile = screenSize.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      constraints: const BoxConstraints(maxWidth: 1440),
      child: isMobile
          ? Column( // Para pantallas móviles: apilamos los elementos
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextSection(),
                const SizedBox(height: 80), // Espacio entre el texto e imagen
                _buildImageSection(),
              ],
            )
          : Row( // Para pantallas grandes: texto e imagen lado a lado
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildTextSection(),
                ),
                
                Expanded(
                  flex: 1,
                  child: _buildImageSection(),
                ),
              ],
            ),
    );
  }

  // Sección de Texto (usada tanto en mobile como desktop)
  Widget _buildTextSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SOBRE NOSOTROS",
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: active,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Burguir Burguir es una pequeña empresa fundada en 2024 "
            "que nace por la pasión a la cocina y por la dedicación "
            "de hacer felices a los clientes amantes de la buena comida.",
            style: GoogleFonts.inter(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: letras,
            ),textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

Widget _buildImageSection() {
  bool isHovered = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Stack(
          children: [
            // Imagen de fondo
            Container(
              padding: const EdgeInsets.all(20),
              color: active, // Fondo naranja detrás de la imagen
              child: Image.asset(
                'assets/modeladoimg.png',
                fit: BoxFit.cover,
              ),
            ),
            // Botón que cubre toda la imagen
            if (isHovered)
              Positioned.fill(
                child: InkWell(
                  onTap: () {
                    // Acción del botón
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Modelado(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.black54, // Fondo semi-transparente
                    alignment: Alignment.center,
                    child: Text(
                      'Ver Modelos 3D',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}


}
