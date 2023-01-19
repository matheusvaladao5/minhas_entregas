import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';
import 'package:minhas_entregas/mydeliveries/model/receiver.dart';
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
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  DefaultInputFormWidget(
                      placeholder: "Informe o produto",
                      label: "Produto",
                      controller: _productController,
                      validationMsg: "Insira o nome do produto",
                      obscureText: false),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  DefaultInputFormWidget(
                      placeholder: "Informe a marca",
                      label: "Marca",
                      controller: _brandController,
                      validationMsg: "Insira o marca do produto",
                      obscureText: false),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Informe o peso", labelText: "Peso"),
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira o peso do produto";
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  MaskedTextField(
                    controller: _initialDateController,
                    mask: "##/##/#####",
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira a data inicial";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Informe a data inicial prevista",
                        labelText: "Data Inicial"),
                  ),
                  MaskedTextField(
                    controller: _finalDateController,
                    mask: "##/##/#####",
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira a data final";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Informe a data final prevista",
                        labelText: "Data Final"),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("receivers")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return LinearProgressIndicator();
                              if (snapshot.data == null) {
                                return Container(
                                    child:
                                        Text("Nenhum recebedor encontrado!"));
                              } else {
                                return _buildDropdownButtonFormField(
                                    context, snapshot.data!.docs);
                              }
                            }),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child:
                            ElevatedButton(onPressed: () {}, child: salvarText),
                      ))
                ],
              ))),
    );
  }

  Widget _buildDropdownButtonFormField(
      BuildContext context, List<QueryDocumentSnapshot> snapshots) {
    return DropdownButtonFormField<dynamic>(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Selecione o recebedor";
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Selecione o Recebedor',
        ),
        items: snapshots.map((data) => _buildDropdownMenuItem(data)).toList(),
        onChanged: (dynamic? newValue) {});
  }

  DropdownMenuItem _buildDropdownMenuItem(QueryDocumentSnapshot data) {
    final receiver = Receiver.fromSnapshot(data);
    return DropdownMenuItem<dynamic>(
      value: receiver,
      child: Text(receiver.name.toString()),
    );
  }
}
