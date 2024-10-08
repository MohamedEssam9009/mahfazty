import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'features/home/ui/screens/home_screen.dart';
import 'features/login/ui/screens/login_screen.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            // There is no user
            return const LoginScreen();
          } else {
            // There is User
            return const HomeScreen();
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
