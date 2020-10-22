import 'package:concessionaria_paiv/models/Car.dart';
import 'package:concessionaria_paiv/utils/DatabaseHelper.dart';
import 'package:concessionaria_paiv/widgets/HorizontalCardWidget.dart';
import 'package:flutter/material.dart';

class VendidosScreen extends StatefulWidget {
  @override
  _VendidosScreenState createState() => _VendidosScreenState();
}

class _VendidosScreenState extends State<VendidosScreen> {
  DatabaseHelper db = DatabaseHelper();
  List<Car> cars = [];
  List<Widget> horizontalCards = [];

  @override
  Widget build(BuildContext context) {
    getCars();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: horizontalCards,
      ),
    );
  }

  getCars() async {
    cars = await db.getSoldCars();
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
