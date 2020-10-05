import 'package:concessionaria_paiv/widgets/HorizontalCardWidget.dart';
import 'package:flutter/material.dart';

class VendidosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> soldCar = <Widget>[
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
    ];
    return SingleChildScrollView(
     child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: soldCar,
      ),
    );
  }
}