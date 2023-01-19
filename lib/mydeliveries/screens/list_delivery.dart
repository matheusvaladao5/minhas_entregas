import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minhas_entregas/mydeliveries/model/delivery.dart';
import 'package:minhas_entregas/mydeliveries/model/status.dart';
import 'package:minhas_entregas/mydeliveries/screens/add_delivery.dart';
import 'package:minhas_entregas/widgets/nav_drawer.dart';

class ListDeliveryWidget extends StatelessWidget {
  const ListDeliveryWidget({Key? key}) : super(key: key);

  final title = const Text("Meus pacotes");

  _insertDelivery(Delivery delivery) async {
    await FirebaseFirestore.instance
        .collection("deliveries")
        .add(delivery.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryFormWidget()))
                    .then((delivery) => _insertDelivery(delivery));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: NavDrawer(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("deliveries")
            .orderBy("email")
            .startAt([user.email!]).endAt(['${user.email!}\uf8ff']).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          if (snapshot.data == null) {
            return Container(child: Text("Nenhum pacote encontrado!"));
          } else {
            return _buildListView(context, snapshot.data!.docs);
          }
        });
  }

  Widget _buildListView(
      BuildContext context, List<QueryDocumentSnapshot> snapshots) {
    return ListView(
        padding: EdgeInsets.only(top: 30),
        children: snapshots.map((data) => _buildItem(data)).toList());
  }

  Widget _buildItem(QueryDocumentSnapshot data) {
    final delivery = Delivery.fromSnapshot(data);
    return Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
              title: Text("${delivery.product} - ${delivery.brand}"),
              subtitle: Text(Status.getEnum(delivery.status).value),
              onLongPress: () {
                data.reference.delete();
              }),
        ));
  }
}
