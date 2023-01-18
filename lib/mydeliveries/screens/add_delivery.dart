import 'package:flutter/material.dart';
import 'package:minhas_entregas/utils/custom_widgets.dart';
import 'package:minhas_entregas/widgets/input_form.dart';

class DeliveryFormWidget extends StatelessWidget {
  DeliveryFormWidget({Key? key}) : super(key: key);

  final title = const Text("Novo Pacote");
  final _formKey = GlobalKey<FormState>();
  final _productController = TextEditingController();
  final _brandController = TextEditingController();
  final _weightController = TextEditingController();
  final _initialDateController = TextEditingController();
  final _finalDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultInputFormWidget(
                      placeholder: "Informe o produto",
                      label: "Produto",
                      controller: _productController,
                      validationMsg: "Insira o nome do produto",
                      obscureText: false),
                  DefaultInputFormWidget(
                      placeholder: "Informe a marca",
                      label: "Marca",
                      controller: _brandController,
                      validationMsg: "Insira o marca do produto",
                      obscureText: false),
                  DefaultInputFormWidget(
                      placeholder: "Informe o peso",
                      label: "Peso",
                      controller: _weightController,
                      validationMsg: "Insira o peso do produto",
                      obscureText: false),
                  DefaultInputFormWidget(
                      placeholder: "Informe a data inicial prevista",
                      label: "Data inicial",
                      controller: _initialDateController,
                      validationMsg: "Insira a data inicial prevista",
                      obscureText: false),
                  DefaultInputFormWidget(
                      placeholder: "Informe a data final prevista",
                      label: "Data final",
                      controller: _finalDateController,
                      validationMsg: "Insira a data final prevista",
                      obscureText: false),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Adição do Produto no Firebase
                          }
                        },
                        child: salvarText),
                  )
                ],
              ))),
    );
  }
}
