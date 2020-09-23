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
                        TextSpan(text: 'Tracker'),
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
                        TextSpan(text: '1.0T'),
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
                        TextSpan(text: 'R\$87.490,00'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
