import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';
import 'package:minhas_entregas/mydeliveries/model/delivery.dart';
import 'package:minhas_entregas/mydeliveries/model/receiver.dart';
import 'package:minhas_entregas/mydeliveries/model/status.dart';
import 'package:minhas_entregas/utils/custom_widgets.dart';
import 'package:minhas_entregas/widgets/input_form.dart';
import 'package:intl/intl.dart';

class DeliveryWidget extends StatelessWidget {
  DeliveryWidget({Key? key, required this.delivery}) : super(key: key);

  final title = const Text("Pacote");
  final Delivery delivery;

  @override
  Widget build(BuildContext context) {
    final Receiver receiver = Receiver.toObject(delivery.receiver);

    return Scaffold(
        appBar: AppBar(title: title),
        body: Container(
            padding: const EdgeInsets.all(40.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${delivery.product} - ${delivery.brand}"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Peso: ${delivery.weight} Kg"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Valor: R\$ ${delivery.rate}"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                    "Status de Pagamento: ${delivery.paid ? 'Quitado' : 'Em aberto'}"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                    "Previsão de entrega: ${DateFormat('dd/MM/yyyy').format(delivery.initialDate)} - ${DateFormat('dd/MM/yyyy').format(delivery.finalDate)}"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                    "Status de Entrega: ${Status.getEnum(delivery.status).value}"),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text("Informações do Receptor:"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Nome: ${receiver.name}"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Endereço: ${receiver.address}"),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Fone: ${receiver.phone}"),
              ],
            ))));
  }
}
