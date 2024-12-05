import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:conia/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Primera extends StatelessWidget {
  const Primera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    // Verificamos si la pantalla es pequeña (mobile)
    bool isMobile = screenSize.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      constraints: const BoxConstraints(maxWidth: 1440),
      child: isMobile
          ? Column( // Para pantallas móviles: apilamos los elementos
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextSection(isMobile),
                const SizedBox(height: 20), // Espacio entre el texto e imagen
                _buildImageSection(),
              ],
            )
          : Row( // Para pantallas grandes: texto e imagen lado a lado
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildTextSection(isMobile),
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
  Widget _buildTextSection(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: isMobile 
            ? CrossAxisAlignment.center  // Centrar texto y botón en mobile
            : CrossAxisAlignment.start,  // Alinear a la izquierda en desktop
        children: [
          Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    const SizedBox(width: 20.0, height: 100.0),
  
      AnimatedTextKit(
            animatedTexts: [
            RotateAnimatedText('Burguiir', 
            textStyle: GoogleFonts.inter(
              fontSize: 110,
              fontWeight: FontWeight.bold,
              color: active,
            ),
            ),
            RotateAnimatedText('Burguiir', 
            textStyle: GoogleFonts.inter(
              fontSize: 110,
              fontWeight: FontWeight.bold,
              color: letras,
            ))
          ],
        onTap: () {
          print("Tap Event");
        },
        repeatForever: true,
        pause: const Duration(milliseconds: 100),
      ),
    
  ],
),
          
          const SizedBox(height: 10),
          // Alineación del botón con Row
          Row(
            mainAxisAlignment: isMobile 
                ? MainAxisAlignment.center  // Centrado en mobile
                : MainAxisAlignment.start, // Alineado a la izquierda en desktop
           
          ),
        ],
      ),
    );
  }

  // Sección de Imagen (usada tanto en mobile como desktop)
  Widget _buildImageSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: 
                    Image.asset(
                      'assets/burgiir-burgiir-logo.png',
                      //width: screenSize.width / 1.9,
                    ),
    );
  }
}
