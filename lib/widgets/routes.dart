import 'package:flutter/material.dart';
import 'package:minhas_entregas/mydeliveries/screens/list_deliveries.dart';
import 'package:minhas_entregas/screens/login.dart';
import 'package:minhas_entregas/screens/register.dart';
import 'package:minhas_entregas/screens/user.dart';

class FirebaseAuthAppRoutes {
  var routes = <String, WidgetBuilder>{
    "/user": (BuildContext context) => UserWidget(),
    "/home": (BuildContext context) => ListDeliveriesWidget(),
    "/login": (BuildContext context) => LoginWidget(),
    "/register": (BuildContext context) => RegisterWidget(),
  };
}
