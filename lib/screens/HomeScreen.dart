import 'package:flutter/material.dart';
import 'package:concessionaria_paiv/widgets/VerticalCardWidget.dart';
import 'package:concessionaria_paiv/widgets/HorizontalCardWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> lastAdded = <Widget>[
      VerticalCard(),
      VerticalCard(),
      VerticalCard(),
      VerticalCard(),
      VerticalCard(),
      VerticalCard(),
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              bottom: 40.0,
              top: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Última venda',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                HorizontalCard(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Carros adicionados recentemente',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: lastAdded,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
