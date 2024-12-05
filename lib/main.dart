import 'package:conia/screens/autentificacion/auth_provider.dart';
import 'package:conia/screens/cart_provider.dart';
import 'package:conia/screens/contactpage.dart';
import 'package:conia/screens/home_destok.dart';
import 'package:conia/screens/home_mobile.dart';
import 'package:conia/screens/home_tablet.dart';
import 'package:conia/screens/login_screen.dart';
import 'package:conia/screens/menupage.dart';
import 'package:conia/screens/modelado.dart';
import 'package:conia/screens/responsive_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burguiir App',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => ResponsiveHome(
          largeScreen: const HomeDesktop(), 
          smallScreen: HomeMobile(), 
          mediumScreen: const HomeTablet()),
        '/menu': (context) =>  MenuPage(),
        '/contact': (context) => const Contactpage(),
        '/login': (context) =>  LoginScreen(),
        '/3d': (context) =>  Modelado(),
      },
    );
  }
}
