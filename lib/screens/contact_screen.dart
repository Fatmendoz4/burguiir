
import 'package:conia/helpers/style.dart';
import 'package:flutter/material.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: 1440),
          width: screenSize.width / 1,
      child: Scaffold(
        
        backgroundColor: bgcolor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título principal
                Text(
                  "COMENTARIOS",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                
                // Subtítulo
                Text(
                  "Cuéntanos qué piensas y cómo lo estamos haciendo",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellow[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                
                // Campo de texto: Nombre
                _buildTextField("Nombre"),
                
                const SizedBox(height: 16),
                
                // Campo de texto: Apellido
                _buildTextField("Apellido"),
                
                const SizedBox(height: 16),
                
                // Campo de texto: Correo Electrónico
                _buildTextField("Correo Electrónico"),
                
                const SizedBox(height: 16),
                
                // Campo de texto: Teléfono
                _buildTextField("Teléfono"),
                
                const SizedBox(height: 16),
                
                // Campo de texto grande: Mensaje
                _buildTextField("Escribe tu mensaje aquí...", maxLines: 5),
                
                const SizedBox(height: 20),
                
                // Botón de Enviar
                ElevatedButton(
                  onPressed: () {
                    // Acción de enviar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Enviar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir un campo de texto
  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.yellow[700]),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow[700]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow[500]!),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}