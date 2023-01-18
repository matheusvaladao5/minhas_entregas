import 'package:flutter/material.dart';
import 'package:minhas_entregas/mydeliveries/screens/add_delivery.dart';
import 'package:minhas_entregas/mydeliveries/screens/list_delivery.dart';
import 'package:minhas_entregas/screens/login.dart';
import 'package:minhas_entregas/screens/register.dart';
import 'package:minhas_entregas/screens/user.dart';

class FirebaseAuthAppRoutes {
  var routes = <String, WidgetBuilder>{
    "/user": (BuildContext context) => const UserWidget(),
    "/home": (BuildContext context) => const ListDeliveryWidget(),
    "/login": (BuildContext context) => const LoginWidget(),
    "/register": (BuildContext context) => RegisterWidget(),
    "/add_delivery": (BuildContext context) => DeliveryFormWidget(),
  };
}
