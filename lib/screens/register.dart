import 'package:flutter/material.dart';
import 'package:minhas_entregas/utils/custom_widgets.dart';
import 'package:minhas_entregas/widgets/input_form.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);

  final title = const Text("Cadastre-se");
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  bool isValidEmail(String email) {
    RegExp reg = new RegExp(r"^[^@]+@[^@]+\.[^@]+$");
    return reg.hasMatch(email);
  }

  void register(BuildContext context) async {
    try {
      

      //if (user )
      //Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultInputFormWidget(
                      placeholder: "Informe o e-mail",
                      label: "E-mail",
                      controller: _emailController,
                      obscureText: false,
                      validationMsg: "Insira um e-mail válido"),
                  DefaultInputFormWidget(
                      placeholder: "Informe a senha com ao menos 6 caracteres",
                      label: "Senha",
                      controller: _passwordController,
                      obscureText: true,
                      validationMsg:
                          "Insira uma senha segura com ao menos 6 caracteres"),
                  DefaultInputFormWidget(
                      placeholder: "Confirme a senha com ao menos 6 caracteres",
                      label: "Confirmação de senha",
                      controller: _passwordConfirmationController,
                      obscureText: true,
                      validationMsg:
                          "Confirme a senha segura com ao menos 6 caracteres"),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (isValidEmail(_emailController.text) &&
                                    (_passwordController.text ==
                                        _passwordConfirmationController.text) &&
                                    _passwordController.text.length > 5) {
                                  register(context);
                                } else {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 200,
                                        color: Colors.amber,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text("E-mail ou senha inválida")
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: salvarText),
                      ))
                ],
              ))),
    );
  }
}
