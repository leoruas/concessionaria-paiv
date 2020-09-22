import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        elevation: 2,
        child: Row(
          children: <Widget>[
            Container(
              height: 170,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(
                      'https://s2.glbimg.com/JMEgHotm57qsaD3uBVjDHPJdyno=/620x413/e.glbimg.com/og/ed/f/original/2020/03/20/novo_tracker_1.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Carro: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'BMW'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Modelo: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'SUDIA951'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Preco: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'R\$80.000,00'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
