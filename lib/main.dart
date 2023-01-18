import 'package:flutter/material.dart';
import 'package:minhas_entregas/screens/home.dart';
import 'package:minhas_entregas/screens/login.dart';
import 'package:minhas_entregas/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeWidget(),
        '/login': (context) => LoginWidget(),
        '/register': (context) => RegisterWidget(),
      },
    );
  }
}
