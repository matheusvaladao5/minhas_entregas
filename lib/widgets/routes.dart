import 'package:flutter/material.dart';
import 'package:minhas_entregas/screens/home.dart';
import 'package:minhas_entregas/screens/login.dart';
import 'package:minhas_entregas/screens/register.dart';

class FirebaseAuthAppRoutes {
  var routes = <String, WidgetBuilder>{
    "/home": (BuildContext context) => HomeWidget(),
    "/login": (BuildContext context) => LoginWidget(),
    "/register": (BuildContext context) => RegisterWidget(),
  };
}
