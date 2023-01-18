import 'package:flutter/material.dart';
import 'package:minhas_entregas/widgets/nav_drawer.dart';

class ListDeliveryWidget extends StatelessWidget {
  const ListDeliveryWidget({Key? key}) : super(key: key);

  final title = const Text("Meus pacotes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/add_delivery");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: NavDrawer(),
      body: ListView(children: []),
    );
  }
}
