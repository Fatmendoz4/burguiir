import 'package:conia/helpers/style.dart';
import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: active, // Fondo naranja
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          // Título con colores personalizados
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "INFORMACIÓN DE\n", // Primera línea
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "CONTACTO", // Segunda línea
                  style: TextStyle(
                    color: bgcolor, // Color hueso
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Horario de Atención (centrado)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                  text: "HORARIO ", // Primera línea
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "DE ", // Segunda línea
                  style: TextStyle(
                    color: bgcolor, // Color hueso
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "ATENCION", // Segunda línea
                  style: TextStyle(
                    color: Colors.white, // Color hueso
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Lunes - Domingo\n(4:00 PM - 9:00 PM)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Redes Sociales (centrado)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                  text: "REDES ", // Primera línea
                  style: TextStyle(
                    color: bgcolor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "SOCIALES ", // Segunda línea
                  style: TextStyle(
                    color: Colors.white, // Color hueso
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Instagram: Burguir_burguiir\nWhatsapp: 2462186132",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          
        ],
      ),
    );
  }
}
