import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
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
                image: NetworkImage(
                    'https://s2.glbimg.com/JMEgHotm57qsaD3uBVjDHPJdyno=/620x413/e.glbimg.com/og/ed/f/original/2020/03/20/novo_tracker_1.jpg'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.01,
              left: size.width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: size.height * 0.022, color: Colors.black),
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
                    style: TextStyle(
                        fontSize: size.height * 0.022, color: Colors.black),
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
                    style: TextStyle(
                        fontSize: size.height * 0.022, color: Colors.black),
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
    );
  }
}
