import 'package:flutter/material.dart';

class TextInputs extends StatefulWidget {
  final updateInfo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController kmController = TextEditingController();
  TextInputs({this.updateInfo});

  @override
  _TextInputsState createState() => _TextInputsState();
}

class _TextInputsState extends State<TextInputs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: widget.nameController,
              onChanged: (value) => widget.updateInfo(widget.nameController.text, widget.modelController.text, widget.brandController.text, widget.priceController.text, widget.yearController.text, widget.kmController.text),
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
              controller: widget.modelController,
              onChanged: (value) => widget.updateInfo(widget.nameController.text, widget.modelController.text, widget.brandController.text, widget.priceController.text, widget.yearController.text, widget.kmController.text),
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
              controller: widget.brandController,
              onChanged: (value) => widget.updateInfo(widget.nameController.text, widget.modelController.text, widget.brandController.text, widget.priceController.text, widget.yearController.text, widget.kmController.text),
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
              controller: widget.priceController,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.updateInfo(widget.nameController.text, widget.modelController.text, widget.brandController.text, widget.priceController.text, widget.yearController.text, widget.kmController.text),
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
              controller: widget.yearController,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.updateInfo(widget.nameController.text, widget.modelController.text, widget.brandController.text, widget.priceController.text, widget.yearController.text, widget.kmController.text),
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
              controller: widget.kmController,
              keyboardType: TextInputType.number,
              onChanged: (value) => widget.updateInfo(widget.nameController.text, widget.modelController.text, widget.brandController.text, widget.priceController.text, widget.yearController.text, widget.kmController.text),
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
