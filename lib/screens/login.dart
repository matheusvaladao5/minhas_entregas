import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minhas_entregas/screens/home.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  final title = const Text("Minhas Entregas");
  final textEmail = "E-mail";
  final textPassword = "Password";
  final textLogin = const Text("Login");
  final textRegister = const Text("Cadastre-se");

  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();


  Future doLogin(BuildContext context) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _pass.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: title,
        ),
        body: Container(
          padding: const EdgeInsets.all(40.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: textEmail,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _pass,
                decoration: InputDecoration(
                  labelText: textPassword,
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0, bottom: 20.0)),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        doLogin(context);
                      },
                      child: textLogin)),
              Padding(padding: const EdgeInsets.only(top: 10.0)),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    icon: const Icon(Icons.add),
                    label: textRegister),
              ),
            ],
          )),
        ));
  }
}
