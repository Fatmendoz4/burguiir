import 'package:conia/screens/home_destok.dart';
import 'package:conia/screens/home_mobile.dart';
import 'package:conia/screens/home_tablet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1024) {
      return const HomeDesktop();
    } else if (screenWidth >= 600) {
      return const HomeTablet();
    } else {
      return HomeMobile();
    }
  }
}