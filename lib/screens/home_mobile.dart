import 'package:conia/helpers/style.dart';
import 'package:conia/screens/about.section.dart';
import 'package:conia/screens/infoburguir.dart';
import 'package:conia/screens/login_screen.dart';
import 'package:conia/screens/primera.dart';
import 'package:conia/screens/promociones_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Image.asset(
          'assets/burgiir-burgiir-logo.png',
          width: 50,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: _buildDrawer(context), // Drawer solo en mobile
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
             const Primera(),
            const AboutSection(),
            PromotionsSection(),
            ContactInfoWidget(),
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
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: bgcolor),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(color: active, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('Menú'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/menu');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Comentarios'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
          ),
          const Divider(),
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Usuario autenticado
                return ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Cerrar sesión'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                );
              } else {
                // Usuario no autenticado
                return ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Iniciar sesión'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}