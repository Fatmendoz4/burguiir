import 'package:conia/screens/home_destok.dart';
import 'package:conia/screens/home_mobile.dart';
import 'package:conia/screens/home_tablet.dart';
import 'package:conia/screens/login_screen.dart';
import 'package:conia/screens/responsive_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {

  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ResponsiveHome(largeScreen: HomeDesktop(), smallScreen: HomeMobile(), mediumScreen: HomeTablet())
        )
      );

    } on FirebaseAuthException catch(e){
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
    }
    catch(e){

    }
  }
    Future<void> signin({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ResponsiveHome(largeScreen: HomeDesktop(), smallScreen: HomeMobile(), mediumScreen: HomeTablet())
        )
      );

    } on FirebaseAuthException catch(e){
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'Wrong password provided for that user.') {
        message = 'An account already exists with that email.';
      }
    }
    catch(e){

    }
  }
  Future<void> signout({
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) =>LoginScreen())
      );
  }
  
}