import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minhas_entregas/widgets/auth_gate.dart';
import 'package:minhas_entregas/widgets/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const AuthGate(),
        routes: FirebaseAuthAppRoutes().routes);
  }
}
