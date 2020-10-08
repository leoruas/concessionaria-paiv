import 'package:concessionaria_paiv/utils/Magic.dart';
import 'package:concessionaria_paiv/widgets/HorizontalCardWidget.dart';
import 'package:flutter/material.dart';

class EstoqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> stockCar = <Widget>[
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
    ];
    return SingleChildScrollView(
      child: Scaffold(
        body: Column(
          Text("Estoque"),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: stockCar,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, newCarRouteName),
          child: Icon(Icons.add),
          backgroundColor: Colors.red.shade900,
        ),
      ),
    );
  }
}
