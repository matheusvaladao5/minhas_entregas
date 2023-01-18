import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minhas_entregas/widgets/nav_drawer.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  final title = const Text("Usuário");

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    Future<void> _signOut(BuildContext context) async {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, "/login");
    }

    return Scaffold(
        appBar: AppBar(title: title),
        drawer: NavDrawer(),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Logado como ',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                user.email!,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () => _signOut(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 32,
                  ),
                  label: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        ));
  }
}
