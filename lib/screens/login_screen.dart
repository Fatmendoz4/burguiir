import 'package:conia/helpers/style.dart';
import 'package:conia/screens/autentificacion/auth_service.dart';
import 'package:conia/screens/registro_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'autentificacion/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
  if (_formKey.currentState!.validate()) {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Simulando inicio de sesión exitoso
    Provider.of<AuthProvider>(context, listen: false).login();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Inicio de sesión exitoso')),
    );

    // Redirigir a la pantalla principal o menú después de iniciar sesión
    Navigator.pop(context);
  }
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        backgroundColor: bgcolor,
      ),
      backgroundColor: bgcolor, // Fondo blanco grisáceo
      body: size.width > 600
          ? Row(
              children: [
                // Imagen en la mitad derecha (solo visible en pantallas grandes)
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://tiendafs.middleby.com.mx/cdn/shop/collections/98ad0315-3f2a-4231-bf0d-355bc3ec91cf_1920x_crop_center.jpg?v=1707511316'), // Reemplaza con una URL real
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Cuadro de formulario en la mitad izquierda
                Container(
                  width: size.width * 0.5,
                  padding: EdgeInsets.all(32.0),
                  child: _buildLoginForm(),
                ),
              ],
            )
          : Center(
              child: Container(
                width: size.width * 0.9,
                padding: EdgeInsets.all(16.0),
                child: _buildLoginForm(),
              ),
              
            ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Iniciar Sesión',
            style: TextStyle(
              color: Color(0xFFEC1C24), // Rojo Burger King
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.0),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              filled: true, // Activa el color de fondo
              fillColor: Colors.white, // Color de fondo del TextFormField
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Por favor ingresa un email válido';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
              filled: true, // Activa el color de fondo
              fillColor: Colors.white, // Color de fondo del TextFormField
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu contraseña';
              }
              if (value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
             backgroundColor: active,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              textStyle: TextStyle(fontSize: 16),
            ),
            onPressed: () async {
              await AuthService().signin(
                email: _emailController.text, 
                password: _passwordController.text, 
                context: context
                );
            },
            child: Text('Iniciar sesión', style: GoogleFonts.inter(color: bgcolor),),
          ),
          SizedBox(height: 16.0),
          // Botón de Registro
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Text(
              '¿No tienes una cuenta? Regístrate',
              style: TextStyle(color: active),
            ),
          ),
        ],
      ),
    );
  }
}