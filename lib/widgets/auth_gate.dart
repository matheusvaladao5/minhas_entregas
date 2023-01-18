import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minhas_entregas/mydeliveries/screens/list_delivery.dart';
import 'package:minhas_entregas/screens/login.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text("Algo deu errado."));
        } else if (snapshot.hasData) {
          return const ListDeliveryWidget();
        }
        return const LoginWidget();
      },
    );
  }
}
