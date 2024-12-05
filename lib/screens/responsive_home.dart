
import 'package:flutter/material.dart';



int smallScreenWidth = 852;
int largeScreenWidth = 1100;  

class ResponsiveHome extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveHome(
      {super.key, required this.largeScreen, required this.smallScreen, required this.mediumScreen});

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenWidth;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > largeScreenWidth;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenWidth &&
      MediaQuery.of(context).size.width <= largeScreenWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      if (maxWidth > largeScreenWidth) {
        return largeScreen;}
        else if (maxWidth >= 650){
          return mediumScreen;
        }
       else {
        return smallScreen;
      }
    });
  }
}



//class ResponsiveHome extends StatelessWidget {
  //const ResponsiveHome({Key? key}) : super(key: key);

  //@override
  //Widget build(BuildContext context) {
    // Detectar si es desktop, tablet o mobile.
    //final screenWidth = MediaQuery.of(context).size.width;

    //if (screenWidth >= 900) {
      //return const HomeDesktop();
    //} else if (screenWidth >= 600) {
      //return const HomeTablet();
    //} else {
      //return HomeMobile(); // Sin const porque usamos GlobalKey en esta vista.
    //}
  //}
//}
