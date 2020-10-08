import 'package:concessionaria_paiv/utils/Magic.dart';
import 'package:flutter/material.dart';

class EstoqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Estoque"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, newCarRouteName),        
        child: Icon(Icons.add),
        backgroundColor: Colors.red.shade900,
      ),
    );
  }
}