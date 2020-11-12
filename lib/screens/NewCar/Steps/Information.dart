import 'package:concessionaria_paiv/models/Car.dart';
import 'package:flutter/material.dart';

class TextInputs extends StatefulWidget {
  final Car car;
  final updateInfo;

  TextInputs(this.car, {this.updateInfo});

  @override
  _TextInputsState createState() => _TextInputsState();
}

class _TextInputsState extends State<TextInputs> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController kmController = TextEditingController();

  void initState() {
    if (widget.car.id != null) {
      setState(() {
        nameController.text = widget.car.name;
        modelController.text = widget.car.model;
        brandController.text = widget.car.brand;
        priceController.text = widget.car.price.toString();
        yearController.text = widget.car.year.toString();
        kmController.text = widget.car.km.toString();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              onChanged: (value) => widget.updateInfo(nameController.text, modelController.text, brandController.text, priceController.text, yearController.text, kmController.text),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'Nome',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: modelController,
              onChanged: (value) => widget.updateInfo(nameController.text, modelController.text, brandController.text, priceController.text, yearController.text, kmController.text),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'Modelo',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: brandController,
              onChanged: (value) => widget.updateInfo(nameController.text, modelController.text, brandController.text, priceController.text, yearController.text, kmController.text),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'Marca',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.updateInfo(nameController.text, modelController.text, brandController.text, priceController.text, yearController.text, kmController.text),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'Preço',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: yearController,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.updateInfo(nameController.text, modelController.text, brandController.text, priceController.text, yearController.text, kmController.text),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'Ano',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: kmController,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.updateInfo(nameController.text, modelController.text, brandController.text, priceController.text, yearController.text, kmController.text),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: 'Quilometragem',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
