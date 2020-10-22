import 'package:concessionaria_paiv/models/Car.dart';
import 'package:concessionaria_paiv/utils/DatabaseHelper.dart';
import 'package:concessionaria_paiv/utils/Magic.dart';
import 'package:concessionaria_paiv/widgets/HorizontalCardWidget.dart';
import 'package:flutter/material.dart';

class EstoqueScreen extends StatefulWidget {
  @override
  _EstoqueScreenState createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  DatabaseHelper db = DatabaseHelper();
  List<Car> cars = [];
  List<Widget> horizontalCards = [];

  @override
  Widget build(BuildContext context) {
    getCars();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: horizontalCards,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, newCarRouteName),
        child: Icon(Icons.add),
        backgroundColor: Colors.red.shade900,
      ),
    );
  }

  getCars() async {
    cars = await db.getCarsInStock();
    List<Widget> list = [];
    cars.forEach((car) {
      list.add(
        HorizontalCard(car: car),
      );
    });
    
    if (mounted)
      setState(() {
        horizontalCards = list;
      });
  }
}
