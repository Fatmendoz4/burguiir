import 'package:conia/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Contactpage extends StatelessWidget {
  const Contactpage({Key? key}) : super(key: key);
  
   // URLs de las redes sociales

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    // Verificamos si la pantalla es pequeña (mobile)
    bool isMobile = screenSize.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
      ),
      backgroundColor: bgcolor,
      body: Stack(
        children: [
          // Formulario principal centrado
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Título principal
                  Text(
                    "COMENTARIOS",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: active,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),

                  // Subtítulo
                  Text(
                    "Cuéntanos qué piensas y cómo lo estamos haciendo",
                    style: TextStyle(
                      fontSize: 16,
                      color: active,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Campos de texto
                  _buildTextField("Nombre"),
                  const SizedBox(height: 16),
                  _buildTextField("Apellido"),
                  const SizedBox(height: 16),
                  _buildTextField("Correo Electrónico"),
                  const SizedBox(height: 16),
                  _buildTextField("Teléfono"),
                  const SizedBox(height: 16),
                  _buildTextField("Escribe tu mensaje aquí...", maxLines: 5),
                  const SizedBox(height: 20),

                  // Botón de Enviar
                  ElevatedButton(
                    onPressed: () {
                      // Acción de enviar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: active,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text("Enviar", style: GoogleFonts.inter(color: bgcolor),),
                  ),
                ],
              ),
            ),
          ),
          // Iconos de redes sociales en la esquina derecha
          
        ],
      ),
    );
  }



  // Método para construir un campo de texto
  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
         border: OutlineInputBorder(),
              filled: true, // Activa el color de fondo
              fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: active),
        ),
      ),
      style: TextStyle(color: active),
    );
  }
}