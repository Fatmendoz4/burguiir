import 'package:conia/helpers/style.dart';
import 'package:conia/screens/about.section.dart';
import 'package:conia/screens/primera.dart';
import 'package:conia/screens/promociones_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

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
              Row(
                mainAxisSize: MainAxisSize.min,
        children: _buildActions(context),  // Botones en AppBar
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
            const Primera(),
            const AboutSection(),
            PromotionsSection(),
          ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => Navigator.pushNamed(context, '/menu'),
        child: Text('Menú', style: TextStyle(color: active, fontWeight: FontWeight.bold)),
      ),
      
      TextButton(
        onPressed: () => Navigator.pushNamed(context, '/contact'),
        child: Text('Contacto', style: TextStyle(color: active,  fontWeight: FontWeight.bold)),
      ),
      
       const SizedBox(width: 20),
      ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/login'),
      style: ElevatedButton.styleFrom(
        backgroundColor: active, // Color del botón
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        'Registrarse',
        style: GoogleFonts.inter(
                        color: bgcolor,
              )),
      ),
    ];
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