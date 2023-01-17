import 'package:flutter/material.dart';
import 'package:minhas_entregas/screens/home.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  final title = const Text("Minhas Entregas");
  final textEmail = "E-mail";
  final textPassword = "Password";
  final textLogin = const Text("Login");

  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

  String get username => _email.text;
  String get password => _pass.text;

  void doLogin(BuildContext context) {
    if (username == 'firebase' && password == 'pass') {
    } else {}
  }

  void register(BuildContext context) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                MaterialButton(
                  height: 40.0,
                  minWidth: 300.0,
                  color: Colors.amber,
                  child: textLogin,
                  onPressed: () {
                    doLogin(context);
                  },
                  splashColor: Colors.blue,
                ),
              ],
            )),
      ),
    );
  }
}
