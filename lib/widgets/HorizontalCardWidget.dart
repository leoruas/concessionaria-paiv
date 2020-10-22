import 'dart:io';

import 'package:concessionaria_paiv/models/Car.dart';
import 'package:concessionaria_paiv/screens/InfoScreen.dart';
import 'package:concessionaria_paiv/utils/Magic.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  HorizontalCard({this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        elevation: 2,
        child: Stack(
          children: <Widget>[
            if (car.id != null)
              Positioned(
                top: screenSize.height * 0.01,
                right: screenSize.height * 0.01,
                child: GestureDetector(
                  child: Icon(Icons.info, color: Colors.grey[500]),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoScreen(car: car),
                    ),
                  ),
                ),
              ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 6.0),
                  height: screenSize.height * 0.22,
                  width: screenSize.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.topCenter,
                      image: car.id == null
                          ? NetworkImage('https://i.imgur.com/ycvwPzI.png')
                          : FileImage(File(car.image)),
                    ),
                  ),
                ),
                if (car.id != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: screenSize.height * 0.022,
                              color: Colors.black),
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
                              fontSize: screenSize.height * 0.022,
                              color: Colors.black),
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
                              fontSize: screenSize.height * 0.022,
                              color: Colors.black),
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
                      //         fontSize: screenSize.height * 0.022,
                      //         color: Colors.black),
                      //     children: <TextSpan>[
                      //       TextSpan(
                      //           text: 'ID: ',
                      //           style: TextStyle(fontWeight: FontWeight.bold)),
                      //       TextSpan(text: car.listID.toString()),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                if (car.id == null)
                  Column(
                    children: [
                      RichText(
                        overflow: TextOverflow.clip,
                        text: TextSpan(
                          text: "Nenhum carro",
                          style: TextStyle(
                              fontSize: screenSize.height * 0.022,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
