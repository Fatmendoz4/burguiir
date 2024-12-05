import 'package:conia/helpers/style.dart';
import 'package:conia/screens/about.section.dart';
import 'package:conia/screens/cart_page.dart';
import 'package:conia/screens/infoburguir.dart';
import 'package:conia/screens/primera.dart';
import 'package:conia/screens/promociones_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/burgiir-burgiir-logo.png',
              width: screenSize.width / 27,
            ),
            const Spacer(),
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Usuario autenticado
                  return _buildActions(context, isLoggedIn: true);
                } else {
                  // Usuario no autenticado
                  return _buildActions(context, isLoggedIn: false);
                }
              },
            ),
          ],
        ),
      ),
       backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1440),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Primera(),
            const AboutSection(),
            PromotionsSection(),
            ContactInfoWidget(),
            //ContactScreen()
             Text(
              "© 2024 By JECY",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context, {required bool isLoggedIn}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/menu'),
          child: Text('Menú', style: TextStyle(color: active, fontWeight: FontWeight.bold)),
        ),
        TextButton(
        onPressed: () => Navigator.pushNamed(context, '/contact'),
        child: Text('Comentarios', style: TextStyle(color: active,  fontWeight: FontWeight.bold)),
      ),

      TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Text("Ver Carrito", style: TextStyle(color: active,  fontWeight: FontWeight.bold)),
              ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            if (isLoggedIn) {
              FirebaseAuth.instance.signOut();
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: Text(
            isLoggedIn ? 'Cerrar sesión' : 'Iniciar sesión',
            style: GoogleFonts.inter(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const SectionHeader({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade100,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text(subtitle),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.orange,
                ),
              ),
            ],
          ),
          Image.asset(
            imagePath,
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}