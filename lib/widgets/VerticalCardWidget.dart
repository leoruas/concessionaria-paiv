import 'dart:io';

import 'package:concessionaria_paiv/models/Car.dart';
import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  VerticalCard({this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: size.height * 0.25,
            width: size.height * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: FractionalOffset.topCenter,
                image: FileImage(File(car.image)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 6.0, top: 4.0),
              constraints: BoxConstraints(maxWidth: size.height * 0.24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: size.height * 0.022, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Carro: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: car.name),
                      ],
                    ),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: size.height * 0.022, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Modelo: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: car.model),
                      ],
                    ),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: size.height * 0.022, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Preco: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "R\$" + car.price.toString()),
                      ],
                    ),
                  ),
                  // RichText(
                  //   overflow: TextOverflow.ellipsis,
                  //   text: TextSpan(
                  //     style: TextStyle(
                  //         fontSize: size.height * 0.022, color: Colors.black),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //           text: 'ID: ',
                  //           style: TextStyle(fontWeight: FontWeight.bold)),
                  //       TextSpan(text: car.id.toString()),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
