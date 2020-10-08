import 'package:concessionaria_paiv/screens/NewCar/NewCar.dart';
import 'package:concessionaria_paiv/utils/Magic.dart';
import 'package:flutter/material.dart';

class Router {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newCarRouteName:
        return MaterialPageRoute(builder: (_) => NewCar());
    }
  }
}
