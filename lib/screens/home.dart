import 'package:flutter/material.dart';
import 'package:minhas_entregas/widgets/nav_drawer.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  final title = const Text("Meus pacotes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      drawer: NavDrawer(),
      body: ListView(children: []),
    );
  }
}
