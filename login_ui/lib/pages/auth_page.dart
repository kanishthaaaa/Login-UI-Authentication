import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/pages/home_page.dart';
import 'package:login_ui/pages/login_or_register_page.dart';
import 'package:login_ui/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //if user logged in
            if (snapshot.hasData) {
              return HomePage();
            }
            //if Not logged in
            else {
              return LoginOrRegisterPage();
            }
          }),
    );
  }
}
