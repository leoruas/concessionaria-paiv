import 'package:concessionaria_paiv/utils/Magic.dart';
import 'package:flutter/material.dart';

class EstoqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, newCarRouteName),
              color: Colors.grey[350],
              child: Text('Adicionar Carro'),
            ),
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, infoCarRouteName),
              color: Colors.grey[350],
              child: Text('info Carro'),
            ),
          ],
        )
    );
  }
}